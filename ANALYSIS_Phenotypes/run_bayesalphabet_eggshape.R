library("data.table")
library("hibayes")
data = read_plink(bfile="./plink2", threads=4, out=tempfile(), mode="A", impute=TRUE)
Z = data$geno

pheno <- fread("egg_shape_ratio_0centered_bayes_format.txt")

Z = as.matrix(Z)
Z = Z[!is.na(pheno),]
y = as.matrix(pheno)[!is.na(pheno)]

Z = Z[!y==-9,]
y = y[!y==-9]

map = data$map

capture.output(bayes(y=y, X=Z, model="BayesA", niter=500000, nburn=20000, outfreq=10000), file="eggshape_bayesa_long.log")
capture.output(bayes(y=y, X=Z, model="BayesB", niter=500000, nburn=20000, outfreq=10000), file="eggshape_bayesb_long.log")
capture.output(bayes(y=y, X=Z, model="BayesBpi", niter=500000, nburn=20000, outfreq=10000), file="eggshape_bayesbpi_long.log")
capture.output(bayes(y=y, X=Z, model="BayesC", niter=500000, nburn=20000, outfreq=10000), file="eggshape_bayesc_long.log")
capture.output(bayes(y=y, X=Z, model="BayesCpi", niter=500000, nburn=20000, outfreq=10000), file="eggshape_bayescpi_long.log")
capture.output(bayes(y=y, X=Z, model="BayesR", niter=500000, nburn=20000, outfreq=10000), file="eggshape_bayesr_long.log")
capture.output(bayes(y=y, X=Z, model="BayesRR", niter=500000, nburn=20000, outfreq=10000), file="eggshape_bayesrr_long.log")
capture.output(bayes(y=y, X=Z, model="BayesLASSO", niter=500000, nburn=20000, outfreq=10000), file="eggshape_bayeslasso_long.log")
