# plink2 --bcf founders_filtered.bcf --pca --allow-extra-chr --vcf-half-call missing
plink2 --vcf founders_filtered_35.vcf --freq --allow-extra-chr --vcf-half-call missing
plink2 --vcf founders_filtered_35.vcf --pca --read-freq plink2.afreq --allow-extra-chr --vcf-half-call missing
mv plink2.eigenval founders35.eigenval
mv plink2.eigenvec founders35.eigenvec
