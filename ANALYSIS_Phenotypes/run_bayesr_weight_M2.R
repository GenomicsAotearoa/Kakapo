library("data.table")
library("hibayes")
data = read_plink(bfile="/home/josephguhlin/software/gcta_1.93.2beta/plink2", threads=4, out=tempfile(), mode="A", impute=TRUE)
geno = data$geno

pheno <- fread("weights_M_bayesR.txt")

fit <- bayes(y=pheno[, 1], X=geno, model="BayesR", niter=1000000, nburn=10000, outfreq=10000, verbose=TRUE, fold=c(0.00, 0.01, 0.05, 0.2), pi=c(0.959, 0.02, 0.02, 0.001), seed=42)
