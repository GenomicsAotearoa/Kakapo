#!/usr/bin/env nextflow

/*
 * This script by Joseph Guhlin
 * joseph.guhlin@gmail.com
 * joseph.guhlin@otago.ac.nz
 * github.com/jguhlin
 * For internal use on the Kakapo Genome Project
 * 2018 Feb 28
 */

Channel
.fromFilePairs(['../../../kakapo_genome/raw/NZGL01983/*/Raw/*R{1,2}.fastq.gz',
 		            '../../../kakapo_genome/raw/NZGL02317/*fastq/*R{1,2}.fastq.gz',
			    '/Volumes/archive/deardenlab/HTS raw sequencing reads/kakapo-genomes/Genome.One.201805/*R{1,2}.fastq.gz'])
  .set { reads_all }

reads_all.into{ reads_adapterremovalv2;
                reads_fastqc }

process AdapterRemovalV2 {
  cache true
  tag { "$read_id" }
  storeDir './output/store/AdapterRemovalV2_store'
  publishDir './results/AdapterRemovalV2'

  conda 'maxibor::adapterremoval2'

  input:
    set read_id, file(reads) from reads_adapterremovalv2

  output:

    set file("${read_id}.pair1.truncated"),
        file("${read_id}.pair2.truncated"),
        file("${read_id}.singleton.truncated"),
        file("${read_id}.collapsed"),
        file("${read_id}.collapsed.truncated"),
        file("${read_id}.discarded") into AdapterRemovalV2_output
    file("${read_id}.settings") into AdapterRemovalV2_qc

  """
  AdapterRemoval --file1 ${reads[0]} --file2 ${reads[1]} --basename ${read_id} --trimns --trimqualities --collapse
  """
}

AdapterRemovalV2_output
	.set { AdapterRemovalV2_output_qc }

process FastQC {
  cache true
  cpus 6
  tag { "$read_id" }
  storeDir './output/store/FastQC'
  publishDir './results/FastQC'

  conda 'fastqc.conda.yaml'

  input:
    set read_id, file(reads) from reads_fastqc

  output:
    file("${read_id}/*_fastqc.zip") into FastQC_qc

  """
  mkdir ${read_id}
  fastqc \
    -o ${read_id} \
    -t 6 \
    --noextract \
    ${reads}
  """
}

process MultiQC_firstrun {
  cache true
  cpus 8
  storeDir './output/store/MultiQC_1'
  publishDir './results/MultiQC_1_PreProcess'

  conda 'python=3.6 bioconda::multiqc'

  input:
    file(arfiles) from AdapterRemovalV2_qc.collect()
    file(fqc) from FastQC_qc.collect()

  output:
    file("multiqc_report.html")

  """
  multiqc -z .
  """
}

AdapterRemovalV2_output_qc.map{ [it[0].baseName.tokenize('.')[0], it]  }
	.into { AR2_output_qc2; ConcatAndCompress }

process FastQC_2 {
  cache true
  cpus 6
  tag { "$read_id" }
  storeDir './output/store/FastQC_2'
  publishDir './results/FastQC_2_PostProcess'

  conda 'fastqc.conda.yaml'

  input:
    set read_id, file(reads) from AR2_output_qc2

  output:
    file("${read_id}/*_fastqc.zip") into FastQC_2_qc

  readid = {$reads[0].baseName.tokenize('.')}

  """
  mkdir ${read_id}
  cat ${reads[0]} ${reads[1]} ${reads[2]} ${reads[3]} ${reads[4]} > ${read_id}.fastq

  fastqc \
    -o ${read_id} \
    -t 6 \
    --noextract \
    ${read_id}.fastq
  """
}

// QC of the trimmed/adapted sequences
process MultiQC_secondrun {
  cache true
  cpus 8
  storeDir './output/store/MultiQC_2'
  publishDir './results/MultiQC_2_PostProcess'

  conda 'python=3.6 bioconda::multiqc'

  input:
    file(fqc) from FastQC_2_qc.collect()

  output:
    file("multiqc_report.html")

  """
  multiqc -z .
  """
}

// QC of the trimmed/adapted sequences
process ConcatenateAndCompressReads {
  cache true
  cpus 2
  tag { "$read_id" }
  storeDir './output/store/ConcatAndCompress'
  publishDir './results/ConcatAndCompress'

  input:
    set read_id, file(reads) from ConcatAndCompress

  output:
    file("*.gz")


  """
  cat ${reads[0]} | gzip --best > ${read_id}.r1.fq.gz
  cat ${reads[1]} | gzip --best > ${read_id}.r2.fq.gz
  cat ${reads[2]} ${reads[3]} ${reads[4]} | gzip --best > ${read_id}.s.fq.gz
  """
}
