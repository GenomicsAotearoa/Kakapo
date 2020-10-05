#!/bin/bash -e
#SBATCH --job-name=DELLY_INV_F # job name (shows up in the queue)
#SBATCH --time=20:00:00      # Walltime (HH:MM:SS)
#SBATCH --mem=16GB          # Memory in GB
#SBATCH --account=uoo02695
#SBATCH --output DELLY_germline_INV_female.%j.out  #CHANGE number for new run
#SBATCH --error DELLY_germline_INV_female.%j.err   #CHANGE number for new run

echo "Job started at "`date`

module purge
module load Delly SAMtools BCFtools

bash /scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/scripts/delly/run_germline_delly_female_INV.sh

echo "Job ended at "`date`
