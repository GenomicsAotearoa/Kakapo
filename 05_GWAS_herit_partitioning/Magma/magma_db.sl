#!/bin/bash

#SBATCH --account               uoo02695
#SBATCH --job-name              magma_db
#SBATCH --mem                   4G
#SBATCH --output                magma_db.out
#SBATCH --time                  01:00:00
#SBATCH --cpus-per-task         4

ml purge
module load MAGMA/1.07b-GCCcore-9.2.0

magma --gene-results gene_owh2.genes.pro.raw --set-annot ./db/c2.cp.v6.2.symbols.gmt --out set_cp_6.2_owh2

