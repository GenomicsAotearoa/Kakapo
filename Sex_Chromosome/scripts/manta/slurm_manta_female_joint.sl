#!/bin/bash -e
#SBATCH --job-name=MANTA_female # job name (shows up in the queue)
#SBATCH --time=08:00:00      # Walltime (HH:MM:SS)
#SBATCH --partition=bigmem
#SBATCH --mem=460GB          # Memory in GB
#SBATCH --cpus-per-task=72 # NeSI has 2 logical CPUs for each physical core
#SBATCH --account=uoo02695
#SBATCH --profile=all	#Tracking resource usage
#SBATCH --output MANTA_female_joint.%j.out  #CHANGE number for new run
#SBATCH --error MANTA_female_joint.%j.err   #CHANGE number for new run

taskset -c -p $$
echo "Job started at "`date`

/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/manta/female/joint_calling/female/runWorkflow.py
echo "Job ended at "`date`
