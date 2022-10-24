library("data.table")
library("hibayes")
data = read_plink(bfile="/home/josephguhlin/software/gcta_1.93.2beta/plink2", threads=4, out=tempfile(), mode="A", impute=TRUE)
geno = data$geno

pheno <- fread("weights_M_bayesR.txt")

fit <- bayes(y=pheno[, 1], X=geno, model="BayesA", niter=10000, nburn=5000, outfreq=100, verbose=TRUE, seed=42, vara=9.0, vare=12.0)
