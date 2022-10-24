library("data.table")
library("hibayes")
data = read_plink(bfile="/home/josephguhlin/software/gcta_1.93.2beta/plink2", threads=4, out=tempfile(), mode="A", impute=TRUE)
geno = data$geno

X = geno
X = apply(as.matrix(X), 2, function(x){x-mean(x)})

set.seed(84)
n = 169
m = dim(geno)[2]
k = 10
h2 = 0.5
qtl = sort(sample(1:m, k))

betaTrue = array(0,m)
betaTrue[qtl] = rnorm(k)

X = as.matrix(X)

g = X%*%betaTrue

vg = var(g)
ve = (1-h2)/h2 * vg

y = g + rnorm(n,0,sqrt(ve))

capture.output(bayes(y=y, X=X, model="BayesA", niter=1000, nburn=500), file="simulation_bayesa_h50_0cent.log")
capture.output(bayes(y=y, X=X, model="BayesB", niter=1000, nburn=500), file="simulation_bayesb_h50_0cent.log")
capture.output(bayes(y=y, X=X, model="BayesBpi", niter=1000, nburn=500), file="simulation_bayesbpi_h50_0cent.log")
capture.output(bayes(y=y, X=X, model="BayesC", niter=1000, nburn=500), file="simulation_bayesc_h50_0cent.log")
capture.output(bayes(y=y, X=X, model="BayesCpi", niter=1000, nburn=500), file="simulation_bayescpi_h50_0cent.log")
capture.output(bayes(y=y, X=X, model="BayesR", niter=1000, nburn=500), file="simulation_bayesr_h50_0cent.log")
capture.output(bayes(y=y, X=X, model="BayesRR", niter=1000, nburn=500), file="simulation_bayesrr_h50_0cent.log")
capture.output(bayes(y=y, X=X, model="BayesLASSO", niter=1000, nburn=500), file="simulation_bayeslasso_h50_0cent.log")
