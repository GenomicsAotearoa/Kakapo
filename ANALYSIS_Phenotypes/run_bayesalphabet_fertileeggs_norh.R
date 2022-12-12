library("data.table")
library("hibayes")
data = read_plink(bfile="./no_rh", threads=4, out=tempfile(), mode="A", impute=TRUE)
X = data$geno

pheno <- fread("FertileEggs_norh_bayes_format.txt")

capture.output(bayes(y=pheno[, 1], X=X, model="BayesA", niter=20000, nburn=2000), file="fertileeggs_norh_bayesa.log")
capture.output(bayes(y=pheno[, 1], X=X, model="BayesB", niter=20000, nburn=2000), file="fertileeggs_norh_bayesb.log")
capture.output(bayes(y=pheno[, 1], X=X, model="BayesBpi", niter=20000, nburn=2000), file="fertileeggs_norh_bayesbpi.log")
capture.output(bayes(y=pheno[, 1], X=X, model="BayesC", niter=20000, nburn=2000), file="fertileeggs_norh_bayesc.log")
capture.output(bayes(y=pheno[, 1], X=X, model="BayesCpi", niter=20000, nburn=2000), file="fertileeggs_norh_bayescpi.log")
capture.output(bayes(y=pheno[, 1], X=X, model="BayesR", niter=20000, nburn=2000), file="fertileeggs_norh_bayesr.log")
capture.output(bayes(y=pheno[, 1], X=X, model="BayesRR", niter=20000, nburn=2000), file="fertileeggs_norh_bayesrr.log")
capture.output(bayes(y=pheno[, 1], X=X, model="BayesLASSO", niter=20000, nburn=2000), file="fertileeggs_norh_bayeslasso.log")
