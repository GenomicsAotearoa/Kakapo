#!/bin/bash -e
#SBATCH --job-name=MANTA_female_B05 # job name (shows up in the queue)
#SBATCH --time=02:00:00      # Walltime (HH:MM:SS)
#SBATCH --mem=32GB          # Memory in GB
#SBATCH --cpus-per-task=16 # NeSI has 2 logical CPUs for each physical core
#SBATCH --account=uoo02695
#SBATCH --profile=all	#Tracking resource usage
#SBATCH --output MANTA_female_B05.%j.out  #CHANGE number for new run
#SBATCH --error MANTA_female_B05.%j.err   #CHANGE number for new run

taskset -c -p $$
echo "Job started at "`date`

/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/manta/female/batch05/runWorkflow.py
echo "Job ended at "`date`
