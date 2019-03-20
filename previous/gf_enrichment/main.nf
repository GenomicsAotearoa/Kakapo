#!/usr/bin/env nextflow

/* Requirements
    clojure
    Augustus (tested with 3.3.2)
    exonerate
    diamond
    mcl
    perl
    samtools
    seqretsplit

*/

params.family = "$baseDir/../../uniprot_sprot.fasta"
params.family_name = "RefSeq"
params.assembly = "$baseDir/../../primary.masked.sorted.fasta"
params.augustus_path = "/Volumes/archive/deardenlab/guhlin/software/augustus-3.3.2/"
params.species_abbrev = "Kakapo"

family = file(params.family)
family_name = params.family_name
assembly = file(params.assembly)
augpath = file(params.augustus_path)
spabbrev = params.species_abbrev

// Really should have one here to split the assembly, to make it even more compatible and compact....

process splitAssembly {
  cache true
  storeDir "./splitAssembly"
  tag { "$assembly" }

  input: file assembly
  output: file("*.fasta") into split_assembly

  """
  seqretsplit -sequence $assembly -outseq seqoutall
  """

}

// Generate augustus PPX profiles
// Preprocess splits into families, based off of blastp + mcl
process preprocessProteinFile {
  cache true
  tag { "${fam}" }
  cpus 32
  cache true
  input:
    file fam from family

  output:
    file 'mcl_fams_*' into mcl_ch

  script:
  """
  diamond makedb --in $fam --db db
  diamond blastp --more-sensitive --threads 32 --query $fam --db db > self-blast.tsv
  cut -f 1,2,12 self-blast.tsv > mcl_input
  mcl mcl_input --abc -I 2
  split -l 1 -a 10 out.mcl_input.I20 mcl_fams_
  """
}

// Once families are split into groups, split them, align them, and generate protein profiles
process generateProteinFamilySequences {
  cache true
  storeDir "./protein_family_seq"
  tag { "${fam}" }
  cache false
  input:
    file fam from family
    file mcl from mcl_ch.flatMap()

  output:
    file("out.${mcl}.fasta") optional true into family_sequences

  script:
  """
  perl $baseDir/scripts/split_groups.pl $mcl $fam
  """
}

family_sequences.into{ family_sequences_unaligned; family_sequences_diamondsearch }

process generateProteinProfiles {
  cache true
  cpus 16
  storeDir "./proteinProfiles"
  tag { "${unaligned.baseName}" }
  errorStrategy 'ignore'
  input:
    file(unaligned) from family_sequences_unaligned.flatMap()

  output:
    file("${unaligned.baseName}.prfl") optional true into protein_profiles

  """
  mafft --anysymbol --thread 16 --maxiterate 1000 --localpair --reorder $unaligned > ${unaligned.baseName}.aln
  ${augpath}/bin/prepareAlign < ${unaligned.baseName}.aln > ${unaligned.baseName}.prepared.aln
  perl ${augpath}/scripts/msa2prfl.pl ${unaligned.baseName}.prepared.aln > ${unaligned.baseName}.prfl

  if [ ! -s ${unaligned.baseName}.prfl ]
  then
    rm ${unaligned.baseName}.prfl
  fi

  """

}

split_assembly.collect().flatMap().set{ fasta }

fasta.into{ dataset_bestmatch; datasets_exonerate; datasets_blocksearch }

process genePrediction {
  tag { "${seq.baseName}-${prfl.baseName}" }
  publishDir "./predicted_genes_raw"
  errorStrategy 'ignore'
  cache true
  cpus 2
  input:
    each file(prfl) from protein_profiles.collect()
    file(seq) from datasets_blocksearch

  ///scaffold_43-out.mcl_fams_aaaaaaafds.gff3
  output:
    file("${seq.baseName}-${prfl.baseName}.gff3") optional true into gp

  script:
    """
    fastBlockSearch --cutoff=0.8 $seq $prfl > ${seq.baseName}-${prfl.baseName}.output 2> /dev/null
    perl $baseDir/scripts/prfl_process.pl ${seq.baseName}-${prfl.baseName}.output ${prfl} $baseDir/config $seq ${seq.baseName}-${prfl.baseName}.gff3

    if [[ -e ${seq.baseName}-${prfl.baseName}.gff3 &&  ! -s ${seq.baseName}-${prfl.baseName}.gff3 ]]
    then
      rm ${seq.baseName}-${prfl.baseName}.gff3
    fi


    """
}

process renameGenes {
  tag {"Rename genes"}
  publishDir "./predicted_genes", mode: 'copy'
  input: file(predictions) from gp.collect()
  output:
    file ("predicted_genes.gff3")
    file ("predicted_genes.aa")

  """
    cat $predictions > predicted_genes.unprocessed.gff3
    clojure $baseDir/scripts/rename_genes.clj $family_name $spabbrev > predicted_genes.gff3
    perl $augpath/scripts/getAnnoFasta.pl predicted_genes.gff3 --seqfile=$assembly
    transeq -sequence predicted_genes3.codingseq -outseq predicted_genes.aa
  """

}

// Skipping exonerate for now, protein profiles should be enough

/*
process identifyBestProteinMatches {
  cache true
  input:
    each file(famseq) from family_sequences_diamondsearch
    file(assembly_file) from dataset_bestmatch

  output:
    file("protein_match.fasta") into best_matches

  """
  diamond makedb --in $famseq --db ${famseq.baseName}
  diamond blastx --db ${famseq.baseName} --query $assembly_file
  """
} */


// Generate exonerate hints for providing to augustus later
// This step takes the longest...

/*
process generateExonerateHints {
  storeDir "./exonerate_results"
  tag { "$seq" }
  input:
    set ID, file(seq) from datasets_exonerate
  output: set file(seq), file("${ID}.hints") into exonerate_hints

  script:
    """
    exonerate --model protein2genome -Q protein -T dna --showtargetgff --query ${params.family} --target ${seq} -S false > ${ID}.gff3
    /Volumes/archive/deardenlab/guhlin/software/augustus-3.3.2/scripts/exonerate2hints.pl --in=${ID}.gff3 --out=${ID}.hints
    """
}

process genePrediction {
  tag { "${hint.baseName}-${prfl.baseName}" }
  publishDir "./predicted_genes_raw"
  input:
    each prfl from prfl_files.collect()
    set file(seq), file(hint) from exonerate_hints

  output:
    file("${hint.baseName}-${prfl.baseName}.gff3") optional true into gp

  script:
    """
    fastBlockSearch --cutoff=0.8 $seq $prfl > ${hint.baseName}-${prfl.baseName}.output
    perl $baseDir/scripts/prfl_process.pl ${hint.baseName}-${prfl.baseName}.output ${prfl} $baseDir/config $seq ${hint.baseName}-${prfl.baseName}.gff3 ${hint}
    """
}

process renameGenes {
  tag {"Rename genes"}
  publishDir "./predicted_genes", mode: 'copy'
  input: file(predictions) from gp.collect()
  output:
    file ("predicted_genes.gff3")
    file ("predicted_genes.aa")

  """
    cat $predictions > predicted_genes.unprocessed.gff3
    clojure $baseDir/scripts/rename_genes.clj $family_name $spabbrev > predicted_genes.gff3
    perl $augpath/scripts/getAnnoFasta.pl predicted_genes.gff3 --seqfile=$assembly
    transeq -sequence predicted_genes3.codingseq -outseq predicted_genes.aa
  """

}
*/
