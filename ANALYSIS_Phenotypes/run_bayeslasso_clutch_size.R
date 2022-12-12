library("data.table")
library("hibayes")
data = read_plink(bfile="/home/josephguhlin/software/gcta_1.93.2beta/plink2", threads=4, out=tempfile(), mode="A", impute=TRUE)
geno = data$geno

pheno <- fread("clutch_size_bayes_format.txt")

fit <- bayes(y=pheno[, 1], X=geno, model="BayesLASSO", niter=500000, nburn=20000, outfreq=1000, verbose=TRUE, seed=42)
