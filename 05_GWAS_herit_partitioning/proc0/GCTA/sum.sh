#!/bin/bash

chrs=(1 2 4 5 6 7 8 9 10 11 12 14 15 16 17 18 19 20 21 22 23 24 25 26)
for i in ${chrs[@]}; 
do 
    echo $i
    output=$(grep "$V(G2)/Vp" 'clo_chrom'$i'_all.hsq')
    echo "chr'$i' $output" >> summary_clo.txt
done 
