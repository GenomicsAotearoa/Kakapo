Channel
  .fromFilePairs("/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/03_Reference_SNPs/DeepVariantTrainedSNPCalling/calling_examples/*.ds0.with_labels-000{??}-of-00018.examples", size: -1)
  .set { alignments }

// alignments.println()

reference = file("/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/03_Reference_SNPs/DeepVariantTrainedSNPCalling/updated_reference.fasta")
reference_idx = file("/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/03_Reference_SNPs/DeepVariantTrainedSNPCalling/updated_reference.fasta.fai")
reference_path = file("/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/03_Reference_SNPs/DeepVariantTrainedSNPCalling/")
shards = 18;
shards_minus_one = shards - 1;

process GPU1callVariants {
  tag { "${accession}" }
  queue 'gpu'
  cpus 4
  memory { 24.GB }
  time { 4.hour + (task.attempt * 4.hour) }
  clusterOptions '--gres gpu:1'
  errorStrategy 'retry'
  maxRetries 10
  container '/scale_wlg_nobackup/filesets/nobackup/uoo02695/deepvariant-0.9.0-gpu.simg'
  containerOptions "--nv -B /cm/local/apps/cuda/libs/current/lib64/"
  module 'Singularity'
  module 'CUDA/10.0.130'
  publishDir "./called_gpu", mode: 'move'

  input:
    set accession, file(examples) from alignments

  output:
    file("${accession}.called")

  """
  export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/cm/local/apps/cuda/libs/current/lib64/
  ls /cm/local/apps/cuda/libs/current/lib64/
  echo ""
  env
  echo ""
  nvidia-smi

  /opt/deepvariant/bin/call_variants \
	--batch_size 2048 \
	--examples "${accession}.*.examples" \
	--outfile ${accession}.called \
	--checkpoint /scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/03_Reference_SNPs/DeepVariantTrainedSNPCalling/model/model.ckpt-435255
  """
}
