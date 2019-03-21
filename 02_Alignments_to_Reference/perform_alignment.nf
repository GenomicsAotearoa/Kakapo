#!/usr/bin/env nextflow

/*
 * This script by Joseph Guhlin
 * joseph.guhlin@gmail.com
 * joseph.guhlin@otago.ac.nz
 * github.com/jguhlin
 * For internal use on the Kakapo Genome Resequencing Project / Genomics Aotearoa
 * 2018 Feb 28
 */

// Get everything to have a decent name FIRST

assembly = file("/Volumes/archive/deardenlab/guhlin/HQG/Kakapo/00_Assembly_Procedures/store/downloaded/assembly.fasta")

Channel
.fromFilePairs('reads/*{r1,r2,s}*.fq.gz', size: 3)
	.set { reads_all }

// Genome must be already bwa indexed

process mapReads {
  tag { "${read_id}" }
  cpus 32
  conda 'bioconda::bwa bioconda::samtools'
//  storeDir './store/alignments/'
  publishDir './results/alignments/'

  // reads[0] reads[1] paired end
  // reads[2] are singles

  input:
    assembly
    set read_id, file(reads) from reads_all

  output:
    set file("*.cram"), file("*.cram.crai") into alignments
    set file("*.idxstats"), file("*.stats"), file("*.flagstats") into multiqc_stats

  // At the end we also gather up statistics for a MultiQC report

  """
  bwa mem -t 32 $assembly \
    ${reads[0]} ${reads[1]} | samtools view -T $assembly -C - > out.paired.cram
  bwa mem -t 32 $assembly \
    ${reads[2]} | samtools view -T $assembly -C - > out.single.cram

  eval `perl $baseDir/scripts/discern_ids.pl $baseDir/SeqIDs_to_name.tsv ${reads[0]}`

  samtools merge --reference $assembly \
    -O CRAM \
    --threads 32 \
    merged.cram \
    out.paired.cram out.single.cram

  samtools view --threads 32 -hT $assembly merged.cram |
  samtools addreplacerg -r ID:\${NAME}_\${LANE} \
    -r SM:\$NAME \
    --reference $assembly --threads 32 - |
  samtools sort --reference $assembly \
      --threads 32 \
      -O CRAM -l 9 -m 8G -o \${NAME}_\${LANE} -

  samtools index \${NAME}_\${LANE}.cram

  samtools stats --reference $assembly \
    --threads 32 \
    \$NAME.cram > \${NAME}_\${LANE}.stats

  samtools flagstat \
    --threads 32 \
    \$NAME.cram > \${NAME}_\${LANE}.flagstats

  samtools idxstats \
    --threads 32 \
    \$NAME.cram > \${NAME}_\${LANE}.idxstats

  mv merged.cram merged.cram.intermediate
  mv out.paired.cram out.paired.cram.intermediate
  mv out.single.cram out.single.cram.intermediate

  """
}

alignments.collect()
  .set { all_alignments }

multiqc_stats.collect()
  .set{ multi_qc_stats }

process MultiQcStats {
  cpus 8
  cache false
  publishDir './results/MultiQC_Aligned'

  conda 'python=3.6 bioconda::multiqc'

  input:
    file("stats") from multi_qc_stats

  output:
    file("multiqc_report.html")

  """
  multiqc -z .
  """

}
