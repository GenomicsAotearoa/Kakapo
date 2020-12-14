#!/bin/bash

chrs=(1 2 4 5 6 7 8 9 10 11 12 14 15 16 17 18 19 20 21 22 23 24 25 26)

for i in ${chrs[@]}; 
do 
    echo $i
    sed -e 's/\<gcta'$i'\>//g' mgrmchrom.txt > multi_grm.txt
    /nfs/research1/stegle/users/lurban/kakapo/GCTA/gcta_1.93.2beta/gcta64 --mgrm multi_grm.txt  --make-grm  --out all_grm
    echo $'all_grm\ngcta'$i'' > mgrmchrom2.txt
    /nfs/research1/stegle/users/lurban/kakapo/GCTA/gcta_1.93.2beta/gcta64 --pheno ../GWAS/clo.tsv --covar ccov.tsv --qcovar qcov.tsv --out 'clo_chrom'$i'_all' --reml --reml-no-constrain --reml-maxit 10000 --mgrm mgrmchrom2.txt
done 
