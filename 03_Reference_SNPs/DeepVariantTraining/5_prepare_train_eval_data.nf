Channel
  .fromFilePairs("/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/03_Reference_SNPs/alignments/*.{cram,cram.crai}", flat: true)
  .set { alignments }

reference = file("/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/03_Reference_SNPs/ref/assembly.fasta")
reference_idx = file("/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/03_Reference_SNPs/ref/assembly.fasta.fai")
reference_path = file("/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/03_Reference_SNPs/ref/")

process makeExamples {
  tag { "${accession}" }
  storeDir "./examples"
  container '/scale_wlg_nobackup/filesets/nobackup/uoo02695/variant-utils_deepvariant_0.9.0.sif'
  cache true
  cpus 8
  queue 'ga_bigmem,bigmem,hugemem,ga_hugemem'
  memory { 62.GB + (task.attempt * 20.GB) }
  time { 12.hour + (task.attempt * 6.hour) }
  errorStrategy 'retry'
  maxRetries 3
  module 'Singularity'
  publishDir "./training_examples", mode: 'move'

  input:
    set accession, cram, crai from alignments
    reference_path

  output:
    set accession, cram, crai, file("${accession}.with_labels.examples") into examples_ch

  """
  ls ${reference_path}

  /opt/deepvariant/bin/make_examples \
      --mode=training \
      --use_ref_for_cram=true \
      --ref=${reference} \
      --examples ${accession}.with_labels.examples \
      --sample_name ${accession} \
      --reads ${cram} \
      --truth_variants=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/03_Reference_SNPs/DeepVariantTraining/final_vcfs/${accession}.vcf.gz \
      --confident_regions=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/03_Reference_SNPs/DeepVariantTraining/training_data/${accession}.bed \
      --downsample_fraction=0.75
  """

}


// --training_random_emit_ref_sites=0.0001
