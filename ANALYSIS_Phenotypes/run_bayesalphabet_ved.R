library("data.table")
library("hibayes")
data = read_plink(bfile="./plink2", threads=4, out=tempfile(), mode="A", impute=TRUE)
Z = data$geno

pheno <- fread("VEDSurvivingEmbryos_bayes_format.txt")
Z = as.matrix(Z)
Z = Z[!is.na(pheno),]
y = as.matrix(pheno)[!is.na(pheno)]

Z = Z[!y==-9,]
y = y[!y==-9]

map = data$map

capture.output(bayes(y=y, M=Z, model="BayesA", niter=500000, nburn=20000, outfreq=10000), file="ved_bayesa_long.log")
capture.output(bayes(y=y, M=Z, model="BayesB", niter=500000, nburn=20000, outfreq=10000), file="ved_bayesb_long.log")
capture.output(bayes(y=y, M=Z, model="BayesBpi", niter=500000, nburn=20000, outfreq=10000), file="ved_bayesbpi_long.log")
capture.output(bayes(y=y, M=Z, model="BayesC", niter=500000, nburn=20000, outfreq=10000), file="ved_bayesc_long.log")
capture.output(bayes(y=y, M=Z, model="BayesCpi", niter=500000, nburn=20000, outfreq=10000), file="ved_bayescpi_long.log")
capture.output(bayes(y=y, M=Z, model="BayesR", niter=500000, nburn=20000, outfreq=10000), file="ved_bayesr_long.log")
capture.output(bayes(y=y, M=Z, model="BayesRR", niter=500000, nburn=20000, outfreq=10000), file="ved_bayesrr_long.log")
capture.output(bayes(y=y, M=Z, model="BayesLASSO", niter=500000, nburn=20000, outfreq=10000), file="ved_bayeslasso_long.log")
