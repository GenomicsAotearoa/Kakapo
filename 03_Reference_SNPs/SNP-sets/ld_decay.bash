../../../software/plink --bcf freebayes.r1.allelicprimitives.q3.bcf  --allow-extra-chr --geno 0.1 --make-bed --snps-only --out filt
shuf filt.bim | head -n 10000
