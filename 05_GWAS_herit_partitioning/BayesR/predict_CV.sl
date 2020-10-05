#!/bin/bash

#SBATCH --account               uoo02695
#SBATCH --job-name              predict
#SBATCH --mem                   6G
#SBATCH --output                predict.out
#SBATCH --time                  1:00:00
#SBATCH --partition             large
#SBATCH --cpus-per-task         4
#SBATCH --array                 0-9

ml purge
module load GCC/9.2.0

FILES=(./results/plum_corrected_plink_f_nr_plum_corrected_CV10_*.frq)
FILE=${FILES[$SLURM_ARRAY_TASK_ID]}

echo ${SLURM_ARRAY_TASK_ID}
#num=$((SLURM_ARRAY_TASK_ID + 1))
num=$((SLURM_ARRAY_TASK_ID))
echo ${num}
OUTFILE=./results/$(basename ${FILE} .frq)_predicted
echo ${OUTFILE}

/nesi/nobackup/uoo02695/Kakapo/05_GWAS_herit_partitioning/BayesR/bayesR/src/bayesR -predict -bfile ./plink/plink_f_nr_plum_corrected_CV10_${num} -param ./results/$(basename ${FILE} .frq).param -freq ${FILE} -out ./${OUTFILE} -model ./results/$(basename ${FILE} .frq).model



