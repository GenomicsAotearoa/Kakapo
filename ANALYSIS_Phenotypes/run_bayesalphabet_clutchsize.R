library("callr")
library("data.table")
library("hibayes")
data = read_plink(bfile="./plink2", threads=4, out=tempfile(), mode="A", impute=TRUE)
Z = data$geno

#pheno <- fread("clutch_size_bayes_format.txt")
pheno <- fread("clutch_size_new_bayes_format.txt")
#pheno <- fread("clutch_size_new_randomonly_bayesformat.tsv")
Z = as.matrix(Z)
Z = Z[!is.na(pheno),]
y = as.matrix(pheno)[!is.na(pheno)]

Z = Z[!y==-9,]
y = y[!y==-9]

map = data$map

#print("Starting background processes")

capture.output(bayes(y=y, M=Z, model="BayesC", niter=5000, nburn=2000, outfreq=100), file="clutchsize_5aug_bayesc_short.log")
capture.output(bayes(y=y, M=Z, model="BayesA", niter=500000, nburn=20000, outfreq=10000), file="clutchsize_5aug_bayesa_long.log")
capture.output(bayes(y=y, M=Z, model="BayesB", niter=500000, nburn=20000, outfreq=10000), file="clutchsize_5aug_bayesb_long.log")
capture.output(bayes(y=y, M=Z, model="BayesBpi", niter=500000, nburn=20000, outfreq=10000), file="clutchsize_5aug_bayesbpi_long.log")
capture.output(bayes(y=y, M=Z, model="BayesC", niter=500000, nburn=20000, outfreq=10000), file="clutchsize_5aug_bayesc_long.log")
capture.output(bayes(y=y, M=Z, model="BayesCpi", niter=500000, nburn=20000, outfreq=10000), file="clutchsize_5aug_bayescpi_long.log")
capture.output(bayes(y=y, M=Z, model="BayesR", niter=500000, nburn=20000, outfreq=10000), file="clutchsize_5aug_bayesr_long.log")
capture.output(bayes(y=y, M=Z, model="BayesRR", niter=500000, nburn=20000, outfreq=10000), file="clutchsize_5aug_bayesrr_long.log")
capture.output(bayes(y=y, M=Z, model="BayesLASSO", niter=500000, nburn=20000, outfreq=10000), file="clutchsize_5aug_bayeslasso_long.log")
