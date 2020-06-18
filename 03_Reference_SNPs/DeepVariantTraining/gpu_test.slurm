#!/bin/bash
#SBATCH -D /scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/03_Reference_SNPs/DeepVariantTraining/
#SBATCH -J nf-runTraining_(null)
#SBATCH -o /scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/03_Reference_SNPs/DeepVariantTraining/gpu-test.log
#SBATCH --no-requeue
#SBATCH -c 4
#SBATCH -t 00:05:00
#SBATCH --mem 55296M
#SBATCH -p gpu
#SBATCH --gres gpu:1

module load Singularity
module load CUDA/10.1.243
module list
nvidia-smi

singularity exec --nv -B /cm/local/apps/cuda/libs/current/lib64/ /scale_wlg_nobackup/filesets/nobackup/uoo02695/variant-utils_deepvariant_0.9.0-gpu.sif /opt/deepvariant/bin/model_train --help
