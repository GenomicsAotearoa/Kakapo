#!/bin/bash

#SBATCH --account               uoo02695
#SBATCH --job-name              plum_corrected_CV
#SBATCH --mem                   10G
#SBATCH --output                plum_corrected_CV.out
#SBATCH --time                  36:00:00
#SBATCH --partition             large
#SBATCH --cpus-per-task         16
#SBATCH --array                 0-9


ml purge
module load GCC/9.2.0

FILES=(./plink/plink_f_nr_plum_corrected_CV10_*.fam)    
FILE=${FILES[$SLURM_ARRAY_TASK_ID]}

echo ${SLURM_ARRAY_TASK_ID}
echo $(basename ${FILE} .fam)

OUTFILE=./results/plum_corrected_$(basename ${FILE} .fam)
echo ${OUTFILE}

/nesi/nobackup/uoo02695/Kakapo/05_GWAS_herit_partitioning/BayesR/bayesR/src/bayesR -bfile ./plink/$(basename ${FILE} .fam) -n 1 -permute -out $OUTFILE -seed 333 


