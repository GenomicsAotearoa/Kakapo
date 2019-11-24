// Nesi Queues Reference
// https://support.nesi.org.nz/hc/en-gb/articles/360000204076-Mahuika-Slurm-Partitions

// Channel
//  .fromFilePairs("/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/03_Reference_SNPs/alignments/*.{cram,cram.crai}", flat: true)
//  .set { alignments }

Channel.fromPath("/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/03_Reference_SNPs/deepvariant/combined/*.called").set { examples }

reference = file("/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/03_Reference_SNPs/ref/assembly.fasta")
reference_idx = file("/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/03_Reference_SNPs/ref/assembly.fasta.fai")
reference_path = file("/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/03_Reference_SNPs/ref/")
cpath = file("/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/03_Reference_SNPs/deepvariant/combined/")

process postprocess_gvcf {
  tag { "${example.baseName}" }
  queue 'prepost'
  time '3h'
  cpus 2
  memory '6GB'
  cache true
  storeDir './gvcfs-store'
  publishDir './gvcfs', mode: 'move', overwrite: true
  module 'Singularity'

  input:
    file(example) from examples
    reference
    reference_idx
    cpath

  output:
    file("${example.baseName}.vcf")
    file("${example.baseName}.final.gvcf")

  """
  /opt/deepvariant/bin/postprocess_variants \
    --ref ${reference} \
    --infile ${cpath}/${example.baseName}.called \
    --outfile ${example.baseName}.vcf \
    --gvcf_outfile ${example.baseName}.final.gvcf \
    --nonvariant_site_tfrecord_path ${cpath}/${example.baseName}.gvcf
  """
}
