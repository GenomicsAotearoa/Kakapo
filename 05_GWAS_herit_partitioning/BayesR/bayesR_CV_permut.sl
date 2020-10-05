#!/bin/bash

#SBATCH --account               uoo02695
#SBATCH --job-name              clo_CV_permut
#SBATCH --mem                   6G
#SBATCH --output                clo_CV_permut.out
#SBATCH --time                  36:00:00
#SBATCH --cpus-per-task         4
#SBATCH --array                 0-9


ml purge
module load GCC/9.2.0

FILES=(./plink_permut/plink_0/plink_f_nr_clo_CV10_*.fam)    
FILE=${FILES[$SLURM_ARRAY_TASK_ID]}

echo ${SLURM_ARRAY_TASK_ID}
echo $(basename ${FILE} .fam)

BFILE=./plink_permut/plink_0/$(basename ${FILE} .fam)
OUTFILE=./plink_permut/results_0/clo_$(basename ${FILE} .fam)
echo ${OUTFILE}

/nesi/nobackup/uoo02695/Kakapo/05_GWAS_herit_partitioning/BayesR/bayesR/src/bayesR -bfile $BFILE -n 1 -permute -out $OUTFILE -seed 333 


