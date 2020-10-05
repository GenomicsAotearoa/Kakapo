#!/bin/bash -e
#SBATCH --job-name=Align_female_5	# job name (shows up in the queue)
#SBATCH --time=15:00:00	# Walltime (HH:MM:SS)
#SBATCH --mem=16GB	# Memory in GB
#SBATCH --account=uoo02695
#SBATCH --output Align_female_B05.%j.out # CHANGE number for new run
#SBATCH --error Align_female_B05.%j.err #  CHANGE number for new run

echo "Job started at "`date`

module purge
module load BWA SAMtools

bash /scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/scripts/bwa/female_bwa_batch5.sh

echo "Job ended at "`date`
