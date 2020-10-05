#!/bin/bash -e
#SBATCH --job-name=GRIDSS_male # job name (shows up in the queue)
#SBATCH --time=15:00:00      # Walltime (HH:MM:SS)
#SBATCH --mem=32GB          # Memory in GB
#SBATCH --account=uoo02695
#SBATCH --output GRIDSS_total_male.%j.out  #CHANGE number for new run
#SBATCH --error GRIDSS_total_male.%j.err   #CHANGE number for new run

echo "Job started at "`date`

module purge
module load Singularity

bash /scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/scripts/GRIDSS/run_total_male_GRIDSS.sh

echo "Job ended at "`date`
