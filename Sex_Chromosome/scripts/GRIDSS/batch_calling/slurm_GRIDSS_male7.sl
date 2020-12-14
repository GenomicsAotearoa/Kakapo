#!/bin/bash -e
#SBATCH --job-name=GRIDSS_maleB7 # job name (shows up in the queue)
#SBATCH --time=09:00:00      # Walltime (HH:MM:SS)
#SBATCH --mem=32GB          # Memory in GB
#SBATCH --account=uoo02695
#SBATCH --output GRIDSS_assemble_male_B07.%j.out  #CHANGE number for new run
#SBATCH --error GRIDSS_assemble_male_B07.%j.err   #CHANGE number for new run

echo "Job started at "`date`

module purge
module load Singularity

bash /scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/GRIDSS/run_male7_GRIDSS.sh

echo "Job ended at "`date`