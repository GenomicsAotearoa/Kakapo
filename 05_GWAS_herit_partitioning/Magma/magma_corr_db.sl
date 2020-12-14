#!/bin/bash

#SBATCH --account               uoo02695
#SBATCH --job-name              magma_db
#SBATCH --mem                   4G
#SBATCH --output                magma_db.out
#SBATCH --time                  01:00:00
#SBATCH --cpus-per-task         4

ml purge
module load MAGMA/1.08-GCCcore-9.2.0
#module load MAGMA/1.07b-GCCcore-9.2.0

magma --gene-results ./output_magma/gene_corr_multi_100M.genes.raw --set-annot ./db/c2.all.v6.2.symbols.gmt --out ./output_magma_db/set_corr_multi_100M

