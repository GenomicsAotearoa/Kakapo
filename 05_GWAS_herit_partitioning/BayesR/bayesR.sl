#!/bin/bash

#SBATCH --account               uoo02695
#SBATCH --job-name              plum_long
#SBATCH --mem                   10G
#SBATCH --output                plum_long.out
#SBATCH --time                  160:00:00
#SBATCH --cpus-per-task         32

ml purge
module load GCC/9.2.0

#/nesi/nobackup/uoo02695/Kakapo/05_GWAS_herit_partitioning/BayesR/bayesR/src/bayesR -bfile ./plink/plink_f_nr_plum_corrected -n 1 -permute -out ./results/plum_corrected -seed 333 

/nesi/nobackup/uoo02695/Kakapo/05_GWAS_herit_partitioning/BayesR/bayesR/src/bayesR -bfile ./plink/plink_f_nr -n 1 -permute -numit 200000 -burnin 50000 -thin 100 -out ./results/plum_long -seed 333
