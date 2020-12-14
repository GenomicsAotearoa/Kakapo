#!/bin/bash

#SBATCH --account               uoo02695
#SBATCH --job-name              magma_corr
#SBATCH --mem                   16G
#SBATCH --output                magma_corr.out
#SBATCH --time                  72:00:00
#SBATCH --cpus-per-task         32

ml purge
module load MAGMA/1.08-GCCcore-9.2.0

magma --gene-model snp-wise=multi --bfile ../plink_final/plink_f_nr --debug set-npar=corr_range,100000000 --gene-annot ./annotation/filtered.genes.annot --out ./output_magma/gene_corr_multi_100M --pval ./RepeatABEL/GWAS1_clo.tsv N=169
# N=144 if owh, 169 if not

