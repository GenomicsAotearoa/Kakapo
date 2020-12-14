#!/bin/bash

#SBATCH --account               uoo02695
#SBATCH --job-name              magma_clo
#SBATCH --mem                   16G
#SBATCH --output                magma_clo_07.out
#SBATCH --time                  24:00:00
#SBATCH --cpus-per-task         32

ml purge
module load MAGMA/1.07b-GCCcore-9.2.0
#module load MAGMA/1.08-GCCcore-9.2.0

magma --gene-model multi --bfile ../plink_final/plink_f_nr --gene-annot ./annotation/filtered_07.genes.annot --out ./output_magma/gene_clo_07 --pval ./RepeatABEL/GWAS1_clo.tsv N=169
# N=144 if owh, 169 if not

