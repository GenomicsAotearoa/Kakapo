#!/bin/bash -e
#SBATCH --job-name=BreakD_Male # job name (shows up in the queue)
#SBATCH --time=4:00:00      # Walltime (HH:MM:SS)
#SBATCH --mem=16GB          # Memory in GB
#SBATCH --account=uoo02695
#SBATCH --output BreakD_male.%j.out  #CHANGE number for new run
#SBATCH --error BreakD_male.%j.err   #CHANGE number for new run

echo "Job started at "`date`

module purge
module load BreakDancer

bash /scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/scripts/breakdancer/run_BreakDancer_male.sh

echo "Job ended at "`date`
