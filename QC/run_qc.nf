#!/usr/bin/env nextflow

Channel
  .fromFilePairs('../../../kakapo_genome/raw/NZGL01983/NZGL01983_C9EP8ANXX/Raw/*R{1,2}.fastq.gz')
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
  AdapterRemoval --file1 ${reads[0]} --file2 ${reads[1]} --basename ${read_id} --trimns --trimqualities
  """
}

AdapterRemovalV2_output.set { flash_processing_raw }

flash_processing_raw.map { [it[0].baseName, [it[0], it[1]]] }
  .set{ flash_processing }

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

process FLASh {
  cache true
  cpus 8
  tag { "$read_id" }
  storeDir './output/store/FLASH'
  publishDir './results/FLASH'

  conda 'bioconda::flash'

  input:
    set read_id, file(reads) from flash_processing

  output:
    set file("${read_id}.extendedFrags.fastq"),
        file("${read_id}.notCombined_1.fastq"),
        file("${read_id}.notCombined_2.fastq"),
        file("${read_id}.hist"),
        file("${read_id}.histogram")
    file("${read_id}_flash.log") into flash_qc

  """
  flash -t 8 -o ${read_id} ${reads[0]} ${reads[1]} 2>&1 | tee ${read_id}_flash.log
  """
}

//Channel.from(AdapterRemovalV2_qc.collect(), flash_qc.collect(), FastQC_qc.collect())
//  .flatMap()
//  .set { multiqc_first }

process MultiQC_firstrun {
  cache true
  cpus 8
  tag { "$read_id" }
  storeDir './output/store/MultiQC'
  publishDir './results/MultiQC'

  conda 'python=3.6 bioconda::multiqc'

  input:
    file(arfiles) from AdapterRemovalV2_qc.collect()
    file(flashfiles) from flash_qc.collect()
    file(fqc) from FastQC_qc.collect()

  output:
    file("multiqc_report.html")

  """
  multiqc -z .
  """
}
