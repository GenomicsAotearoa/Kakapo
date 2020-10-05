#!/bin/bash

#SBATCH --account               uoo02695
#SBATCH --job-name              plot_nesi
#SBATCH --mem                   6G
#SBATCH --output                plot_nesi.out
#SBATCH --time                  1:00:00
#SBATCH --cpus-per-task         4

module load  R/3.5.3-gimkl-2018b

Rscript Plot_NeSI.R plink/GWAS_clo_corrected.Cloacitis_pheno.glm.logistic clo LD

#/nesi/nobackup/uoo02695/Kakapo/05_GWAS_herit_partitioning/plink2/plink2 \
--bfile ../plink_final/plink_f_nr --pheno plum_corrected.tsv --no-pheno --logistic --ci 0.95 \
--covar cov.tsv --allow-no-sex --chr-set 89 --memory 18000 --threads 10 --out plink/GWAS_plum_corrected


