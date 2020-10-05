#!/bin/sh

# This script runs the two steps in hybrid peeling. In the first step a 
# HD snp array is used to generate segregation estimates along each chromosome. 
# In the second step the segregation estimates are used to call and impute 
# sequence data in the entire population.

# The sample population consists of 10 generations with 200 individuals 
# per generations. Individuals are genotyped on a single chromosome with 300 SNPs. 
# The sequence data was generated at 2x coverage spanning 3,000 segregating sites.

# The final R-script calculates the accuracy (as correlation between the 
# genotype dosages and the true genotypes) for each individual in the populations, 
# and then summeries the result stratified by each generation.

#Before running the script, change directories to be in the same directories as the spec files.

#Windows users: Please note, you will also need to extract the dlls in dlls.zip,
# and will need to run AlphaPeel.exe AlphaPeelSpec_HD.txt.

./AlphaPeel AlphaPeelSpec_HD.txt
./AlphaPeel AlphaPeelSpec_SeqFromHD.txt
Rscript analyzeResults.r

