library("hibayes")

set.seed(42)
n = 10000
m = 1000
k = 10
h2 = 0.5
# Result
# BayesR estimated == Estimated hsq 0.5102 ± 0.0236
#--------------------------------------------------

n = 1000
m = 1000
Z = matrix(sample(c(0, 1, 2), n*m, prob=c(0.25, 0.5, 0.25), replace=TRUE), n)
Z = apply(Z, 2, function(x){x-mean(x)})
k = 10
qtl = sort(sample(1:m, k))
betaTrue = array(0,m)
betaTrue[qtl] = rnorm(k)
h2 = 0.5
# Results
# Estimated hsq 0.4960 ± 0.0317

n = 200
m = 1000
X = matrix(sample(c(0, 1, 2), n*m, prob=c(0.25, 0.5, 0.25), replace=TRUE), n)
X = apply(Z, 2, function(x){x-mean(x)})
k = 10
betaTrue = array(0,m)
betaTrue[qtl] = rnorm(k)
h2 = 0.5
# Results
# Estimated hsq 0.0180 ± 0.0071

n = 500
m = 1000
X = matrix(sample(c(0, 1, 2), n*m, prob=c(0.25, 0.5, 0.25), replace=TRUE), n)
X = apply(Z, 2, function(x){x-mean(x)})
k = 10
betaTrue = array(0,m)
betaTrue[qtl] = rnorm(k)
h2 = 0.5
# Results
# Estimated hsq 0.6204 ± 0.0464

n = 250
m = 1000
X = matrix(sample(c(0, 1, 2), n*m, prob=c(0.25, 0.5, 0.25), replace=TRUE), n)
X = apply(Z, 2, function(x){x-mean(x)})
k = 10
betaTrue = array(0,m)
betaTrue[qtl] = rnorm(k)
h2 = 0.5
# Results
# Estimated hsq 0.0073 ± 0.0049

n = 300
m = 1000
X = matrix(sample(c(0, 1, 2), n*m, prob=c(0.25, 0.5, 0.25), replace=TRUE), n)
X = apply(Z, 2, function(x){x-mean(x)})
k = 10
betaTrue = array(0,m)
betaTrue[qtl] = rnorm(k)
h2 = 0.5
# Results
# Estimated hsq 0.6132 ± 0.0632

n = 280
m = 1000
X = matrix(sample(c(0, 1, 2), n*m, prob=c(0.25, 0.5, 0.25), replace=TRUE), n)
X = apply(Z, 2, function(x){x-mean(x)})
k = 10
betaTrue = array(0,m)
betaTrue[qtl] = rnorm(k)
h2 = 0.5
# Results
# Estimated hsq 0.5960 ± 0.0638

n = 275
m = 1000
X = matrix(sample(c(0, 1, 2), n*m, prob=c(0.25, 0.5, 0.25), replace=TRUE), n)
X = apply(Z, 2, function(x){x-mean(x)})
k = 10
betaTrue = array(0,m)
betaTrue[qtl] = rnorm(k)
h2 = 0.5
# Results
# Estimated hsq 0.0303 ± 0.0190

n = 200
m = 1000
X = matrix(sample(c(0, 1, 2), n*m, prob=c(0.25, 0.5, 0.25), replace=TRUE), n)
X = apply(Z, 2, function(x){x-mean(x)})
k = 50
qtl = sort(sample(1:m, k))
betaTrue = array(0,m)
betaTrue[qtl] = rnorm(k)
h2 = 0.95
# Results
# Estimated hsq 0.0164 ± 0.0104

n = 200
m = 1000
X = matrix(sample(c(0, 1, 2), n*m, prob=c(0.25, 0.5, 0.25), replace=TRUE), n)
X = apply(Z, 2, function(x){x-mean(x)})
k = 100
qtl = sort(sample(1:m, k))
betaTrue = array(0,m)
betaTrue[qtl] = rnorm(k)
h2 = 0.6
# Results

g = Z%*%betaTrue
vg = var(g)
ve = (1-h2)/h2 * vg
y = g + rnorm(n,0,sqrt(ve))

fit = bayes(y=y, Z=Z, model="R", niter=1000, nburn=500)
