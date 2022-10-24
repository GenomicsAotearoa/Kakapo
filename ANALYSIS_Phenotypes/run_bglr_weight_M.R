library("data.table")
library("BGLR")
data = read_plink(bfile="/home/josephguhlin/software/gcta_1.93.2beta/plink2", threads=4, out=tempfile(), mode="A", impute=TRUE)
geno = data$geno

pheno <- fread("weights_M_bayesR.txt")

fit <- bayes(y=pheno[, 1], X=geno, model="BayesR", niter=40000, nburn=10000, outfreq=1000, verbose=TRUE, fold=c(0.00, 0.01, 0.05, 0.1), pi=c(0.95, 0.02, 0.02, 0.01), seed=42)
