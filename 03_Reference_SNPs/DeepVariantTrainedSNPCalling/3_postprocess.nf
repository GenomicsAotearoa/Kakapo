// Nesi Queues Reference
// https://support.nesi.org.nz/hc/en-gb/articles/360000204076-Mahuika-Slurm-Partitions

Channel
//  .fromFilePairs("/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/03_Reference_SNPs/alignments-dvtest/*.{cram,cram.crai}", flat: true)
//  .fromFilePairs("/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/03_Reference_SNPs/alignments/*.{cram,cram.crai}", flat: true)
  .fromPath("/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/03_Reference_SNPs/DeepVariantTrainedSNPCalling/called/*.called")
  .set { called_ch }

reference = file("/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/03_Reference_SNPs/DeepVariantTrainedSNPCalling/updated_reference.fasta")
reference_idx = file("/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/03_Reference_SNPs/DeepVariantTrainedSNPCalling/updated_reference.fasta.fai")
reference_path = file("/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/03_Reference_SNPs/DeepVariantTrainedSNPCalling/")
data_dir = file("/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/03_Reference_SNPs/DeepVariantTrainedSNPCalling/calling_examples/");

process postprocess {
  tag { "${called.baseName}" }
  queue 'prepost'
  time '3h'
  cpus 2
  memory '6GB'
  cache true
  publishDir './vcfs', mode: 'copy', overwrite: true
  container '/scale_wlg_nobackup/filesets/nobackup/uoo02695/variant-utils_deepvariant_0.9.0.sif'
  containerOptions "-B /scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/03_Reference_SNPs/DeepVariantTrainedSNPCalling/calling_examples/"
  module 'Singularity'

  input:
    file(called) from called_ch
    reference
    reference_idx
    data_dir

  output:
    set file("${called.baseName}.gvcf"), file("${called.baseName}.vcf")

  """
  /opt/deepvariant/bin/postprocess_variants \
    --ref ${reference} \
    --infile ${called} \
    --outfile ${called.baseName}.vcf \
    --gvcf_outfile ${called.baseName}.gvcf \
    --nonvariant_site_tfrecord_path "${data_dir}/${called.baseName}@18.gvcf"
  """
}
