#!/bin/bash

#SBATCH --account               uoo02695
#SBATCH --job-name              predict
#SBATCH --mem                   6G
#SBATCH --output                predict.out
#SBATCH --time                  1:00:00
#SBATCH --partition             large
#SBATCH --cpus-per-task         4

ml purge
module load GCC/9.2.0

/nesi/nobackup/uoo02695/Kakapo/05_GWAS_herit_partitioning/BayesR/bayesR/src/bayesR -predict -bfile ./plink/plink_f_nr_CV10_1 -param ./results/plum_plink_f_nr_CV10_1.param -freq ./results/plum_plink_f_nr_CV10_1.frq -out ./results/plum_plink_f_nr_CV10_1_predicted -model ./results/plum_plink_f_nr_CV10_1.model



