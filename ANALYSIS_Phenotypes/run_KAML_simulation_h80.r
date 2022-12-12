library("data.table")
library("hibayes")
library("KAML")

data = read_plink(bfile="/home/josephguhlin/software/gcta_1.93.2beta/plink2", threads=4, out=tempfile(), mode="A", impute=TRUE)

geno = data$geno
X = geno

set.seed(42)
n = 169
m = dim(geno)[2]
k = 10
h2 = 0.80
qtl = sort(sample(1:m, k))

betaTrue = array(0,m)
betaTrue[qtl] = rnorm(k)

X = as.matrix(X)
g = X%*%betaTrue
vg = var(g)
ve = (1-h2)/h2 * vg
y = g + rnorm(n,0,sqrt(ve))

y_true = y

to_replace = sample(1:length(y), 30, replace=FALSE)

y[to_replace] <- NA

colnames(y) <- c("h2_0.5")

write.table(y, 'KAML_sim_h2_0.8.txt', quote=FALSE, sep="\t", row.names=FALSE)

out <- KAML(
  pfile="KAML_sim_h2_0.8.txt", 
  pheno=1, 
  gfile="geno", 
  cpu=12,
  sample.num=10, 
  crv.num=5,
  GWAS.model="MLM",
  vc.method="brent",
  theSeed=42, 
  K.method="vanraden", 
  cor.threshold=0.90, 
  ref.gwas=FALSE, 
  GWAS.npc=0
)

replaced = y_true[to_replace]
test_set = out$gebv[to_replace]

cor(replaced, test_set)
cor(replaced, out$y[to_replace])

