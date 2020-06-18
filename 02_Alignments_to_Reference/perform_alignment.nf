#!/usr/bin/env nextflow

/*
 * This script by Joseph Guhlin
 * joseph.guhlin@gmail.com
 * joseph.guhlin@otago.ac.nz
 * github.com/jguhlin
 * For internal use on the Kakapo Genome Resequencing Project / Genomics Aotearoa
 * 2019 28 Feb - Header added
 * 2019 25 March - Convert to SLURM for NeSI
 */

// assembly = file("/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/00_Assembly_Procedures/store/downloaded/assembly.fasta")
assembly = file("/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/02_Alignments_to_Reference/updated_reference.fasta")

Channel
.fromFilePairs('/nesi/project/uoo02695/reads_processed/*{r1,r2,s}*.fq.gz', size: 3)
	.into { reads_all; debug }

debug.println()

// Genome must be already bwa indexed

process mapReads {
  tag { "${read_id}" }
  cpus 32
  queue 'large'
  time '6h'
  memory '48 GB'
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
  samtools addreplacerg -r "ID:\${NAME}_\${LANE}" \
    -r "SM:\$NAME" \
    --reference $assembly --threads 32 - |
  samtools sort --reference $assembly \
      --threads 32 \
      -O CRAM -l 9 -o "\${NAME}_\${LANE}".cram -

  samtools index "\${NAME}_\${LANE}".cram

  samtools stats --reference $assembly \
    --threads 32 \
    "\${NAME}_\${LANE}".cram > "\${NAME}_\${LANE}".stats

  samtools flagstat \
    --threads 32 \
    "\${NAME}_\${LANE}".cram > "\${NAME}_\${LANE}".flagstats

  samtools idxstats \
    --threads 32 \
    "\${NAME}_\${LANE}".cram > "\${NAME}_\${LANE}".idxstats

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
  queue 'large'
  memory '16 GB'
  time '12 h'
  publishDir './results/MultiQC_Aligned'

  conda 'bioconda::multiqc'

  input:
    file('*') from multi_qc_stats

  output:
    file("multiqc_report.html")
    file("multiqc_data.zip")

  """
  multiqc -z --interactive .
  """

}
