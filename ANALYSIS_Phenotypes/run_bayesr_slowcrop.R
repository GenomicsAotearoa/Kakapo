library("data.table")
library("hibayes")
data = read_plink(bfile="/home/josephguhlin/software/gcta_1.93.2beta/plink2", threads=4, out=tempfile(), mode="A", impute=TRUE)
geno = data$geno

pheno <- fread("slowcrop_e0.txt")

fit <- bayes(y=pheno[, 1], X=geno, model="BayesR", niter=500000, nburn=20000, outfreq=10000, verbose=TRUE, seed=42, fold=c(0.00, 0.01, 0.05, 0.2), pi=c(0.95, 0.02, 0.02, 0.01))
