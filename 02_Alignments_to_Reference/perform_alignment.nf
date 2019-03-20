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

Channel
.fromFilePairs('reads/*{r1,r2,s}*.fq.gz', size: 3)
	.set { reads_all }

process addNames {
  cpus 1

  input:
    set read_id, file(reads) from reads_all

  output:
    set new_id, lane, ${reads[0]}, ${reads[1]}, ${reads[2]}

  """
  
  """

}

process mapReads {
  tag { "${reads_id}" }
  cpus 16
  conda 'bioconda::bwa bioconda::samtools'
  storeDir './output/store/alignments/'
  publishDir './results/alignments/'

  // reads[0] reads[1] paired end
  // reads[1] are singles

  input:
    set read_id, file(reads) from processed_reads

  output:
    set file("${read_id}.cram"), file("${read_id}.cram.crai") into alignments
    set file("${read_id}.idxstats"), file("${read_id}"), file("${read_id}") into multiqc_stats

  // At the end we also gather up statistics for a MultiQC report

  """
  bwa mem -t 16 ../primary.masked.sorted.fasta \
    ${reads[0]} ${reads[1]} | samtools view -T ../primary.masked.sorted.fasta -C - > out.paired.cram
  bwa mem -t 16 ../primary.masked.sorted.fasta
    ${reads[2]} | samtools view -T ../primary.masked.sorted.fasta -C - > out.single.cram

  samtools merge --reference ../primary.masked.sorted.fasta \
    -O CRAM \
    --threads 16 \
    merged.cram \
    out.paired.cram out.single.cram

  samtools view --threads 16 -hT merged.cram |
  samtools addreplacerg -r ${read_id} --reference ../primary.masked.sorted.fasta --threads 16 |
  samtools sort --reference ../primary.masked.sorted.fasta \
      --threads 16 \
      -O CRAM -l 9 -m 8G -o ${read_id}.cram
  samtools index ${read_id}.cram

  samtools stats --reference ../primary.masked.sorted.fasta \
    --threads 16 \
    ${read_id}.cram > ${read_id}.stats

  samtools flagstats --reference ../primary.masked.sorted.fasta \
    --threads 16 \
    ${read_id}.cram > ${read_id}.flagstats

  samtools idxstats \
    --threads 16 \
    ${read_id}.cram > ${read_id}.idxstats
  """
}

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
