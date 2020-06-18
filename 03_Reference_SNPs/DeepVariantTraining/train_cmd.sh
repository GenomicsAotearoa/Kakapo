singularity exec ../../../variant-utils_deepvariant_0.9.0.sif model_train --dataset_config_pbtxt=kakapo.
pbtext --train_dir="./model_training/" --model_name="inception_v3" --batch_size=1024 --learning_rate=0.008 --start_from_checkpoint=/opt/models/wgs/model.
ckpt
