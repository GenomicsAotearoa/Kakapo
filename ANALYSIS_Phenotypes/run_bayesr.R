library("data.table")
library("hibayes")
data = read_plink(bfile="/home/josephguhlin/software/gcta_1.93.2beta/plink2", threads=4, out=tempfile(), mode="D", impute=TRUE)
geno = data$geno

pheno <- fread("slowcrop_e0.txt")

fit <- bayes(y=pheno[, 1], X=geno, model="BayesR", niter=40000, nburn=10000, outfreq=1000, verbose=TRUE, seed=42)
