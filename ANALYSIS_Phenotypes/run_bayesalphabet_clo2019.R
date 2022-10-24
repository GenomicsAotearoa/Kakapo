library("data.table")
library("hibayes")
data = read_plink(bfile="filtered_maf0005", threads=8, out=tempfile(), mode="A", impute=TRUE)
X = data$geno

pheno <- fread("clo2019_bayes_format.csv")

capture.output(bayes(y=pheno[, 2], X=X, model="BayesA", niter=20000, nburn=2000), file="clo2019_bayesa.log")
capture.output(bayes(y=pheno[, 2], X=X, model="BayesB", niter=20000, nburn=2000), file="clo2019_bayesb.log")
capture.output(bayes(y=pheno[, 2], X=X, model="BayesBpi", niter=20000, nburn=2000), file="clo2019_bayesbpi.log")
capture.output(bayes(y=pheno[, 2], X=X, model="BayesC", niter=20000, nburn=2000), file="clo2019_bayesc.log")
capture.output(bayes(y=pheno[, 2], X=X, model="BayesCpi", niter=20000, nburn=2000), file="clo2019_bayescpi.log")
capture.output(bayes(y=pheno[, 2], X=X, model="BayesR", niter=20000, nburn=2000), file="clo2019_bayesr.log")
capture.output(bayes(y=pheno[, 2], X=X, model="BayesRR", niter=20000, nburn=2000), file="clo2019_bayesrr.log")
capture.output(bayes(y=pheno[, 2], X=X, model="BayesLASSO", niter=20000, nburn=2000), file="clo2019_bayeslasso.log")
