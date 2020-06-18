Channel
  .fromFilePairs("/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/03_Reference_SNPs/alignments/*.{cram,cram.crai}", flat: true)
  .set { alignments }

reference = file("/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/03_Reference_SNPs/DeepVariantTrainedSNPCalling/updated_reference.fasta")
reference_idx = file("/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/03_Reference_SNPs/DeepVariantTrainedSNPCalling/updated_reference.fasta.fai")
reference_path = file("/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/03_Reference_SNPs/DeepVariantTrainedSNPCalling/")
shards = 18;
shards_minus_one = shards - 1;

process makeExamples {
  tag { "${accession}" }
  storeDir "./examples"
  container '/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/03_Reference_SNPs/DeepVariantTrainedSNPCalling_0.10.0/deepvariant-0.10.0.sif'
  cache true
  cpus 18
  queue 'prepost,large,ga_bigmem,bigmem,hugemem,ga_hugemem'
  memory { 22.GB + (task.attempt * 4.GB) }
  time { (task.attempt * 12.hour) }
  errorStrategy 'retry'
  maxRetries 10
  module 'Singularity'
  module 'Parallel'
  publishDir "./calling_examples", mode: 'move'

  input:
    set accession, cram, crai from alignments
    reference_path

  output:
    set accession, cram, crai, file("${accession}.*.with_labels*.examples"), file("*.gvcf")

  """
  ls ${reference_path}

  time seq 0 ${shards_minus_one} | \
  parallel --eta --halt 2 \
  /opt/deepvariant/bin/make_examples \
      --mode=calling \
      --use_ref_for_cram=true \
      --ref=${reference} \
      --examples ${accession}.ds0.with_labels@${shards}.examples \
      --sample_name ${accession} \
      --reads ${cram} \
      --gvcf ${accession}@${shards}.gvcf \
      --write_run_info \
      --task {}
  """
}
