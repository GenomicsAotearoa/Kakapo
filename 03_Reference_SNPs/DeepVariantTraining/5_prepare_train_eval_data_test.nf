Channel
  .fromFilePairs("/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/03_Reference_SNPs/alignments/*.{cram,cram.crai}", flat: true)
  .set { alignments }

reference = file("/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/03_Reference_SNPs/ref/assembly.fasta")
reference_idx = file("/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/03_Reference_SNPs/ref/assembly.fasta.fai")
reference_path = file("/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/03_Reference_SNPs/ref/")

process makeExamples {
  tag { "${accession}" }
  storeDir "./examples_test"
  container '/scale_wlg_nobackup/filesets/nobackup/uoo02695/variant-utils_deepvariant_0.9.0.sif'
  cache true
  cpus 8
  queue 'prepost,large,ga_bigmem,bigmem,hugemem,ga_hugemem'
  memory { (task.attempt * 2.GB) }
  time { (task.attempt * 2.hour) }
  errorStrategy 'retry'
  maxRetries 10
  module 'Singularity'
  publishDir "./training_examples_test", mode: 'move'

  input:
    set accession, cram, crai from alignments
    reference_path

  output:
    set accession, cram, crai, file("${accession}.*.with_labels.examples") into examples_ch

  """
  ls ${reference_path}

  /opt/deepvariant/bin/make_examples \
      --mode=training \
      --use_ref_for_cram=true \
      --ref=${reference} \
      --examples ${accession}.ds0.with_labels.examples \
      --sample_name ${accession} \
      --reads ${cram} \
      --truth_variants=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/03_Reference_SNPs/DeepVariantTraining/final_vcfs/${accession}.vcf.gz \
      --confident_regions=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/03_Reference_SNPs/DeepVariantTraining/training_data/${accession}.bed \
      --regions CM013783.1 \
      --write_run_info

  """

}

//       --labeler_algorithm=customized_classes_labeler \

//       --downsample_fraction=0.85 // Too much??
// --training_random_emit_ref_sites=0.0001
