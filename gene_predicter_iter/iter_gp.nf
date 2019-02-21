#!/usr/bin/env nextflow

params.assembly = "../primary.masked.sorted.fasta"
params.name_short = "kakapo"
params.name_full = "Strigops habroptilus"
params.augustus_default = "generic"
params.protein_evidence = "../protein_evidence.fasta"
params.busco_seed_species = "generic"
params.busco_db = "aves"
params.max_intronlen = "100000"
params.round = 0

log.info """\
    Iterative Genome Annotation Tool. ROUND ${params.round}
    ================================
    assembly                         : ${params.assembly}
    genome name(short)               : ${params.name_short}
    genome name(full)                : ${params.name_full}
    Augustus Starting Species Config : ${params.augustus_default}
    Extrinsic Protein Evidence       : ${params.protein_evidence}
    BUSCO Seed Species               : ${params.busco_seed_species}
    BUSCO DB                         : ${params.busco_db}
    Max Intron Length                : ${params.max_intronlen}

    Genome is expected to be Repeat Masked before this process begins...
    Sorting is optional but preferred....
    Funannotate [REF] is used in many of these steps...

    """.stripIndent()

assembly = file(params.assembly)
name_short = params.name_short
name_full = params.name_full
augustus_default = params.augustus_default
protein_evidence = file(params.protein_evidence)
busco_seed_species = file(params.busco_seed_species)
busco_db = params.busco_db
max_intronlen = params.max_intronlen
round = params.round
next_round = round
next_round++

process nextRoundPredict {
    conda 'funannotate'
    input:
      file assembly from Channel.from(assembly)

    output:
      file "predict_results/*.proteins.fa" into protein_predictions
      file "predict_results/*.gff3" into gene_predictions
      file "predict_results/*.transcripts.fa" into transcript_predictions

    storeDir "${name_short}_round${round}"

  """
    export PATH=/Volumes/archive/deardenlab/guhlin/software/augustus-3.3.2/bin:$PATH
    export AUGUSTUS_CONFIG_PATH=/Volumes/archive/deardenlab/guhlin/software/augustus-3.3.2/config

    /Volumes/archive/deardenlab/guhlin/software/funannotate/funannotate predict \
	     -i $assembly \
	     -o ${name_short}_round${round} \
	     -s "${name_full}" \
	     --name ${name_short} \
	     --augustus_species ${name_short}_round${round} \
	     --busco_seed_species generic \
	     --organism other \
	     --optimize_augustus \
	     --busco_db aves \
	     --max_intronlen ${max_intronlen} \
	     --protein_evidence ${protein_evidence} $FUNANNOTATE_DB/uniprot_sprot.fasta \
	     --cpus 32
  """
}
