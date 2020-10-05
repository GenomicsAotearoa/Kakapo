bcftools view '-iQUAL>=99 & FMT/DP>=3 & FMT/GQ>=50' -v snps -Ob -o gwas_set.bcf ../Trained.bcf      

