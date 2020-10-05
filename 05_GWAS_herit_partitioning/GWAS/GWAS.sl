#!/bin/bash

#SBATCH --account               uoo02695
#SBATCH --job-name              GWAS
#SBATCH --mem                   6G
#SBATCH --output                GWAS.out
#SBATCH --time                  36:00:00
#SBATCH --partition             large
#SBATCH --cpus-per-task         4

/nesi/nobackup/uoo02695/Kakapo/05_GWAS_herit_partitioning/plink2/plink2 \
--bfile ../plink_final/plink_f_nr --pheno plum_corrected.tsv --no-pheno --logistic --ci 0.95 \
--covar cov.tsv --allow-no-sex --chr-set 89 --memory 18000 --threads 10 --out plink/GWAS_plum_corrected


