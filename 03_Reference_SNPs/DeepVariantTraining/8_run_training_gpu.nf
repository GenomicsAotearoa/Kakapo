reference = file("/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/03_Reference_SNPs/ref/assembly.fasta")
reference_idx = file("/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/03_Reference_SNPs/ref/assembly.fasta.fai")
reference_path = file("/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/03_Reference_SNPs/ref/")
training_dir = file("/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/03_Reference_SNPs/DeepVariantTraining/model_training/")

config_path = file("/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/03_Reference_SNPs/DeepVariantTraining/kakapo.pbtext")

process runTraining {
  tag { "${accession}" }
  container '/scale_wlg_nobackup/filesets/nobackup/uoo02695/variant-utils_deepvariant_0.9.0.sif'
  cpus 4
  queue 'gpu'
  memory 54.GB
  clusterOptions '--gres gpu:2'
  containerOptions "--nv -B /cm/local/apps/cuda/libs/current/lib64/"
  time 72.hour
  container '/scale_wlg_nobackup/filesets/nobackup/uoo02695/deepvariant-0.9.0-gpu.simg'
  module 'Singularity'
  module 'CUDA/10.0.130'

  input:
    config_path
    training_dir

  output:
    set accession, cram, crai, file("${accession}.with_labels.examples") into examples_ch

  """
  export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/cm/local/apps/cuda/libs/current/lib64/
  ls /cm/local/apps/cuda/libs/current/lib64/
  echo ""
  env
  echo ""
  nvidia-smi
  # /opt/deepvariant/bin/model_train --help
  /opt/deepvariant/bin/model_train \
    --dataset_config_pbtxt=${config_path} \
    --batch_size=306 \
    --train_dir=${training_dir} \
    --model_name="inception_v3" \
    --learning_rate=0.001 \
    --start_from_checkpoint=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/03_Reference_SNPs/DeepVariantTraining/model_training/model.ckpt-415662 \
    --number_of_steps=500000000 \
    --save_interval_secs 300 \
    --worker_replicas 2
  """

}

//   # export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/cm/local/apps/cuda/libs/current/lib64/

