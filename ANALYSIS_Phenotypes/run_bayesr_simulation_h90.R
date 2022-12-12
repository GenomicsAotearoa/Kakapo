library("data.table")
library("hibayes")
data = read_plink(bfile="/home/josephguhlin/software/gcta_1.93.2beta/plink2", threads=4, out=tempfile(), mode="A", impute=TRUE)
geno = data$geno

X = geno

set.seed(42)
n = 169
m = dim(geno)[2]
k = 10
h2 = 0.9
qtl = sort(sample(1:m, k))

betaTrue = array(0,m)
betaTrue[qtl] = rnorm(k)

X = as.matrix(X)

g = X%*%betaTrue

vg = var(g)
ve = (1-h2)/h2 * vg

y = g + rnorm(n,0,sqrt(ve))

capture.output(bayes(y=y, X=X, model="BayesR", niter=1000, nburn=500), file="simulation_bayesr_default.log")
capture.output(bayes(y=y, X=X, model="BayesR", niter=1000, nburn=500, fold=c(0.00, 0.01, 0.05, 0.2), pi=c(0.95, 0.02, 0.02, 0.01)), file="simulation_bayesrh90_sim1.log")
capture.output(bayes(y=y, X=X, model="BayesR", niter=1000, nburn=500, fold=c(0.00, 0.01, 0.05, 0.2), pi=c(0.995, 0.002, 0.002, 0.001)), file="simulation_bayesrh90_sim2.log")
capture.output(bayes(y=y, X=X, model="BayesR", niter=1000, nburn=500, fold=c(0.00, 0.01, 0.05, 0.1), pi=c(0.995, 0.002, 0.002, 0.001)), file="simulation_bayesrh90_sim3.log")
capture.output(bayes(y=y, X=X, model="BayesR", niter=1000, nburn=500, fold=c(0.00, 0.01, 0.02, 0.05), pi=c(0.95, 0.02, 0.02, 0.01)), file="simulation_bayesrh90_sim4.log")
capture.output(bayes(y=y, X=X, model="BayesR", niter=1000, nburn=500, fold=c(0.00, 0.005, 0.01, 0.02), pi=c(0.95, 0.02, 0.02, 0.01)), file="simulation_bayesrh90_sim5.log")
capture.output(bayes(y=y, X=X, model="BayesR", niter=1000, nburn=500, fold=c(0.00, 0.05, 0.1, 0.5), pi=c(0.995, 0.002, 0.002, 0.001)), file="simulation_bayesrh90_sim6.log")
capture.output(bayes(y=y, X=X, model="BayesR", niter=1000, nburn=500, fold=c(0.00, 0.01, 0.2, 0.4), pi=c(0.990, 0.06, 0.03, 0.01)), file="simulation_bayesrh90_sim7.log")
