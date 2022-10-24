library("callr")
library("data.table")
library("hibayes")
data = read_plink(bfile="./plink2", threads=4, out=tempfile(), mode="A", impute=TRUE)
Z = data$geno

pheno <- fread("clutch_size.mean.tsv")

Z = as.matrix(Z)
Z = Z[!is.na(pheno),]
y = as.matrix(pheno)[!is.na(pheno)]

Z = Z[!y==-9,]
y = y[!y==-9]

map = data$map

#print("Starting background processes")

#capture.output(bayes(y=y, M=Z, model="BayesC", niter=5000, nburn=500, outfreq=100), file="clutchsize_mean_27July_bayesc_short.log")
#capture.output(bayes(y=y, M=Z, model="BayesC", niter=50000, nburn=5000, outfreq=10000), file="clutchsize_mean_27July_bayesc_long.log")
#capture.output(bayes(y=y, M=Z, model="BayesA", niter=50000, nburn=5000, outfreq=10000), file="clutchsize_mean_27July_bayesa_long.log")
#capture.output(bayes(y=y, M=Z, model="BayesB", niter=50000, nburn=5000, outfreq=10000), file="clutchsize_mean_27July_bayesb_long.log")
#capture.output(bayes(y=y, M=Z, model="BayesBpi", niter=50000, nburn=5000, outfreq=10000), file="clutchsize_mean_27July_bayesbpi_long.log")
#capture.output(bayes(y=y, M=Z, model="BayesC", niter=50000, nburn=5000, outfreq=10000), file="clutchsize_mean_27July_bayesc_long.log")
#capture.output(bayes(y=y, M=Z, model="BayesCpi", niter=50000, nburn=5000, outfreq=10000), file="clutchsize_mean_27July_bayescpi_long.log")
#capture.output(bayes(y=y, M=Z, model="BayesR", niter=50000, nburn=5000, outfreq=10000), file="clutchsize_mean_27July_bayesr_long.log")
#capture.output(bayes(y=y, M=Z, model="BayesRR", niter=50000, nburn=5000, outfreq=10000), file="clutchsize_mean_27July_bayesrr_long.log")
capture.output(bayes(y=y, M=Z, model="BayesL", niter=50000, nburn=5000, outfreq=10000), file="clutchsize_mean_27July_bayeslasso_long.log")
