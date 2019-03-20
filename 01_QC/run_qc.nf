#!/usr/bin/env nextflow


/*
 * This script by Joseph Guhlin
 * joseph.guhlin@gmail.com
 * joseph.guhlin@otago.ac.nz
 * github.com/jguhlin
 * For internal use on the Kakapo Genome Resequencing Project / Genomics Aotearoa
 * 2019 Feb 28
 */


// ['../../../kakapo_genome/raw/NZGL01983/*/Raw/*R{1,2}.fastq.gz',
//                            '../../../kakapo_genome/raw/NZGL02317/*fastq/*R1*.fastq.gz',
//                           '/Volumes/archive/deardenlab/HTS raw sequencing reads/kakapo-genomes/Genome.One.201805/*R{1,2}.fastq.gz'])


Channel
.fromFilePairs('reads/*R{1,2}*.fastq.gz')
	.set { reads_all }

reads_all.into{ reads_adapterremovalv2;
                reads_fastqc }

process AdapterRemovalV2 {
  cpus 8
  cache true
  tag { "$read_id" }
  storeDir './output/store/AdapterRemovalV2_store'
  publishDir './results/AdapterRemovalV2'

  conda 'maxibor::adapterremoval2 bioconda::fastp'

  input:
    set read_id, file(reads) from reads_adapterremovalv2

  output:

    set file("${read_id}.pair1.truncated"),
        file("${read_id}.pair2.truncated"),
        file("${read_id}.singleton.truncated"),
        file("${read_id}.collapsed"),
        file("${read_id}.collapsed.truncated"),
        file("${read_id}.discarded") into AdapterRemovalV2_output
    set file("${read_id}.settings"),
	file("${read_id}.fastp.html"),
	file("${read_id}.fastp.json") into AdapterRemovalV2_qc

  """
  fastp -i ${reads[0]} -I ${reads[1]} -o r1.fq.gz -O r2.fq.gz
  AdapterRemoval --file1 r1.fq.gz --file2 r2.fq.gz --basename ${read_id} --trimns --trimqualities --collapse
  mv fastp.html ${read_id}.fastp.html
  mv fastp.json ${read_id}.fastp.json
  """
}

AdapterRemovalV2_output
	.set { AdapterRemovalV2_output_qc }

process FastQC {
  cache true
  cpus 8
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
  cpus 12
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
	.into { AR2_output_qc2; ConcatAndCompress; KAT_analysis }

process FastQC_2 {
  cache true
  cpus 12
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

/*process performKatAnalyses {
  cache true
  cpus 12
  storeDir './output/store/KAT'
  publishDir './results/KAT'

  conda 'bioconda::kat'

  input:
    set read_id, file(reads) from KAT_analysis

  output:
    set file("${read_id}.dist_analysis.json"),
        file("${read_id}.png") into KAT_results

  """
  kat hist -o ${read_id} \
    -t 8 \
    ${reads[0]} ${reads[1]} ${reads[2]} ${reads[3]} ${reads[4]}
  kat gcp -o ${read_id} \
    -t 8 \
    ${reads[0]} ${reads[1]} ${reads[2]} ${reads[3]} ${reads[4]}
  """
}*/

// QC of the trimmed/adapted sequences
process MultiQC_secondrun {
  cache true
  cpus 12
  publishDir './results/MultiQC_2_PostProcess'

  conda 'python=3.6 bioconda::multiqc'

  input:
    file(fqc) from FastQC_2_qc.collect()
//    file(kats) from KAT_results.collect()

  output:
    file("multiqc_report.html")

  """
  multiqc -z .
  """
}

// QC of the trimmed/adapted sequences
process ConcatenateAndCompressReads {
  cache false
  cpus 16
  maxForks 4
  tag { "$read_id" }
  storeDir './output/store/ConcatAndCompress'
  publishDir './results/ConcatAndCompress'

  input:
    set read_id, file(reads) from ConcatAndCompress

  output:
    set file("${read_id}.r1.fq.gz"),
		    file("${read_id}.r2.fq.gz"),
				file("${read_id}.s.fq.gz") into ConcatOut


  """
  cat ${reads[0]} | pigz --best -b 2048 -p 16 > ${read_id}.r1.fq.gz
  cat ${reads[1]} | pigz --best -b 2048 -p 16 > ${read_id}.r2.fq.gz
  cat ${reads[2]} ${reads[3]} ${reads[4]} | pigz --best -b 2048 -p 16 > ${read_id}.s.fq.gz
  """
}

ConcatOut.collect()
