// Nesi Queues Reference
// https://support.nesi.org.nz/hc/en-gb/articles/360000204076-Mahuika-Slurm-Partitions

Channel
  .fromFilePairs("/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/03_Reference_SNPs/alignments-dvtest/*.{cram,cram.crai}", flat: true)
  .set { alignments }

reference = file("/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/03_Reference_SNPs/ref/assembly.fasta")
reference_idx = file("/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/03_Reference_SNPs/ref/assembly.fasta.fai")
reference_path = file("/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/03_Reference_SNPs/ref/")

process makeExamples {
  tag { "${accession}" }
  storeDir "./examples"
  cache true
  cpus 2
  queue 'prepost'
  memory '6GB'
  time '3h'
  module 'Singularity/.3.1.0'

  input:
    set accession, cram, crai from alignments
    reference_path

  output:
    set accession, cram, crai, file("${accession}.examples") into examples_ch

  """
  ls ${reference_path}
  /opt/deepvariant/bin/make_examples \
      --mode=calling \
      --use_ref_for_cram=true \
      --ref=${reference} \
      --examples ${accession}.examples \
      --reads ${cram}
  """

}

process callVariants {
  tag { "${accession}" }
  storeDir "./calledVariants"
  cache true
  cpus 2
  memory '12GB'
  queue 'large'
  time '16h'
  module 'Singularity/.3.1.0'

  input:
    reference_path
    set accession, cram, crai, examples from examples_ch

  output:
    set accession, cram, crai, file("${accession}.called") into called_ch

  """
  /opt/deepvariant/bin/call_variants \
    --examples ${examples} \
    --outfile ${accession}.called \
    --checkpoint /opt/models/wgs/model.ckpt
  """

}

process postprocess {
  tag { "${accession}" }
  queue 'prepost'
  time '3h'
  cpus 2
  memory '6GB'
  cache true
  publishDir './vcfs', mode: 'copy', overwrite: true
  module 'Singularity/.3.1.0'

  input:
    set accession, cram, crai, called from called_ch
    reference
    reference_idx

  output:
    file("${accession}.vcf")

  """
  /opt/deepvariant/bin/postprocess_variants \
    --ref ${reference} \
    --infile ${called} \
    --outfile ${accession}.vcf
  """
}
