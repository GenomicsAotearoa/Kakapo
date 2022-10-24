import os

script = """
library("data.table")
library("hibayes")
data = read_plink(bfile="/home/josephguhlin/software/gcta_1.93.2beta/plink2", threads=4, out=tempfile(), mode="A", impute=TRUE)
geno = data$geno

X = geno

set.seed(42)
n = 169
m = dim(geno)[2]
k = {n_causative_snps}
h2 = {heritability}
qtl = sort(sample(1:m, k))
threads = 4

betaTrue = array(0,m)
betaTrue[qtl] = rnorm(k)

X = as.matrix(X)
g = X%*%betaTrue
vg = var(g)
ve = (1-h2)/h2 * vg

y = g + rnorm(n,0,sqrt(ve))

capture.output(bayes(y=y, M=X, model="BSLMM", niter={niter}, nburn={nburn}, threads=threads, lambda=0.0001, outfreq=1000),    file="results/simulation_bslmm_k_{n_causative_snps}_h2_{heritability}_niter_{niter}_nburn_{nburn}_iter_{iter}.log")
capture.output(bayes(y=y, M=X, model="BayesA", niter={niter}, nburn={nburn}, threads=threads, lambda=0.0001, outfreq=1000),   file="results/simulation_bayesa_k_{n_causative_snps}_h2_{heritability}_niter_{niter}_nburn_{nburn}_iter_{iter}.log")
capture.output(bayes(y=y, M=X, model="BayesB", niter={niter}, nburn={nburn}, threads=threads, lambda=0.0001, outfreq=1000),   file="results/simulation_bayesb_k_{n_causative_snps}_h2_{heritability}_niter_{niter}_nburn_{nburn}_iter_{iter}.log")
capture.output(bayes(y=y, M=X, model="BayesBpi", niter={niter}, nburn={nburn}, threads=threads, lambda=0.0001, outfreq=1000), file="results/simulation_bayesbpi_k_{n_causative_snps}_h2_{heritability}_niter_{niter}_nburn_{nburn}_iter_{iter}.log")
capture.output(bayes(y=y, M=X, model="BayesC", niter={niter}, nburn={nburn}, threads=threads, lambda=0.0001, outfreq=1000),   file="results/simulation_bayesc_k_{n_causative_snps}_h2_{heritability}_niter_{niter}_nburn_{nburn}_iter_{iter}.log")
capture.output(bayes(y=y, M=X, model="BayesCpi", niter={niter}, nburn={nburn}, threads=threads, lambda=0.0001, outfreq=1000), file="results/simulation_bayescpi_k_{n_causative_snps}_h2_{heritability}_niter_{niter}_nburn_{nburn}_iter_{iter}.log")
capture.output(bayes(y=y, M=X, model="BayesR", niter={niter}, nburn={nburn}, threads=threads, lambda=0.0001, outfreq=1000),   file="results/simulation_bayesr_k_{n_causative_snps}_h2_{heritability}_niter_{niter}_nburn_{nburn}_iter_{iter}.log")
capture.output(bayes(y=y, M=X, model="BayesRR", niter={niter}, nburn={nburn}, threads=threads, lambda=0.0001, outfreq=1000),  file="results/simulation_bayesrr_k_{n_causative_snps}_h2_{heritability}_niter_{niter}_nburn_{nburn}_iter_{iter}.log")
capture.output(bayes(y=y, M=X, model="BayesL", niter={niter}, nburn={nburn}, threads=threads, lambda=0.0001, outfreq=1000),   file="results/simulation_bayesl_k_{n_causative_snps}_h2_{heritability}_niter_{niter}_nburn_{nburn}_iter_{iter}.log")
capture.output(bayes(y=y, M=X, model="BayesR", fold=c(0.00, 0.001, 0.001, 0.01), pi=c(0.995, 0.002, 0.002, 0.001), outfreq=1000),
	niter={niter}, nburn={nburn}, threads=threads, lambda=0.0001),   file="results/simulation_bayesr_custom0_k_{n_causative_snps}_h2_{heritability}_niter_{niter}_nburn_{nburn}_iter_{iter}.log")
capture.output(bayes(y=y, M=X, model="BayesR", fold=c(0.00, 0.0001, 0.001, 0.01), pi=c(0.70, 0.15, 0.10, 0.05), outfreq=1000),
        niter={niter}, nburn={nburn}, threads=threads, lambda=0.0001),   file="results/simulation_bayesr_custom1_k_{n_causative_snps}_h2_{heritability}_niter_{niter}_nburn_{nburn}_iter_{iter}.log")
capture.output(bayes(y=y, M=X, model="BayesR", fold=c(0.00, 0.0005, 0.005, 0.05), pi=c(0.95, 0.02, 0.02, 0.01), outfreq=1000),
        niter={niter}, nburn={nburn}, threads=threads, lambda=0.0001),   file="results/simulation_bayesr_custom2_k_{n_causative_snps}_h2_{heritability}_niter_{niter}_nburn_{nburn}_iter_{iter}.log")
capture.output(bayes(y=y, M=X, model="BayesR", fold=c(0.00, 0.001, 0.01, 0.1), pi=c(0.70, 0.15, 0.10, 0.05), outfreq=1000),
        niter={niter}, nburn={nburn}, threads=threads, lambda=0.0001),   file="results/simulation_bayesr_custom3_k_{n_causative_snps}_h2_{heritability}_niter_{niter}_nburn_{nburn}_iter_{iter}.log")
capture.output(bayes(y=y, M=X, model="BayesR", fold=c(0.00, 0.0001, 0.001, 0.01), pi=c(0.60, 0.25, 0.15, 0.05), outfreq=1000),
        niter={niter}, nburn={nburn}, threads=threads, lambda=0.0001),   file="results/simulation_bayesr_custom4_k_{n_causative_snps}_h2_{heritability}_niter_{niter}_nburn_{nburn}_iter_{iter}.log")
capture.output(bayes(y=y, M=X, model="BayesR", fold=c(0.00, 0.0005, 0.005, 0.05), pi=c(0.60, 0.25, 0.15, 0.05), outfreq=1000),
        niter={niter}, nburn={nburn}, threads=threads, lambda=0.0001),   file="results/simulation_bayesr_custom5_k_{n_causative_snps}_h2_{heritability}_niter_{niter}_nburn_{nburn}_iter_{iter}.log")
"""

# Pi is proportion of SNPs
# Fold is variance explained by SNPs
# BayesR Defaults
# Pi <- c(0.95, 0.02, 0.02, 0.01)
# if(is.null(fold))	fold <- c(0, 0.0001, 0.001, 0.01)


# print(script.format(iter=1, n_causative_snps="10", heritability="0.05", nburn="500", niter="1000"))
heritabilities = [
    "0.01",
    "0.05",
    "0.10",
    "0.15",
    "0.20",
    "0.30",
    "0.40",
    "0.50",
    "0.60",
    "0.70",
    "0.80",
    "0.85",
    "0.90",
    "0.95",
    "0.99",
    "1.0",
]
ks = [10, 100, 1000, 10000]

for k in ks:
    for herit in heritabilities:
        for iter in range(0, 10):
            with open(
                "bayes_simulation/rscript_for_simulation_{iter}_{n_causative_snps}_{heritability}_{nburn}_{niter}_{iter}.R".format(
                    iter=iter,
                    n_causative_snps=k,
                    heritability=herit,
                    nburn="20000",
                    niter="50000",
                ),
                "w",
            ) as fh:
                fh.write(
                    script.format(
                        iter=iter,
                        n_causative_snps=k,
                        heritability=herit,
                        nburn="20000",
                        niter="50000",
                    )
                )
                # print("Done")
            # os.system("/opt/microsoft/ropen/4.0.2/lib64/R/bin/Rscript rscript_for_simulation.R")
