#!/bin/bash

#SBATCH --account               uoo02695
#SBATCH --job-name              magma_owh2
#SBATCH --mem                   16G
#SBATCH --output                magma_owh2.out
#SBATCH --time                  10:00:00
#SBATCH --cpus-per-task         16

ml purge
module load MAGMA/1.07b-GCCcore-9.2.0

magma --gene-model multi --bfile ../plink_final/plink_f_nr --gene-annot filtered.genes.annot --out gene_owh2 --pval ./RepeatABEL/GWAS1_clo_owh.tsv N=144
# N=144 if owh

