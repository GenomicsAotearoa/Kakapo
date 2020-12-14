#!/bin/bash -e
#SBATCH --job-name=GRIDSS_male # job name (shows up in the queue)
#SBATCH --time=30:00:00      # Walltime (HH:MM:SS)
#SBATCH --partition=bigmem
#SBATCH --mem=460GB          #Memory in GB
#SBATCH --cpus-per-task=72
#SBATCH --account=uoo02695
#SBATCH --output GRIDSS_male_joint.%j.out  #CHANGE number for new run
#SBATCH --error GRIDSS_male_joint.%j.err   #CHANGE number for new run

echo "Job started at "`date`

module purge
module load Singularity

bash /scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/scripts/GRIDSS/run_male_joint_GRIDSS.sh

echo "Job ended at "`date`
