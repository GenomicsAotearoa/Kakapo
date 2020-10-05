library("data.table")
#source("http://zzlab.net/GAPIT/GAPIT.library.R")
source("http://www.zzlab.net/GAPIT/GAPIT.library.R")
source("http://zzlab.net/GAPIT/gapit_functions.txt")

warnings()

myY <- read.table("phenos_gapit.csv", head=TRUE)
#myG <- fread("hapmap_from_plink.hmp.txt", head=FALSE)
myG <- fread("../all_snps.maf.numeric.hapmap.removescaffoldsfornow.hmp.txt", head=FALSE)

print(myY)

#Y=myY[,c(1,2)]
myGAPIT_MLM <- GAPIT(
	Y=myY[,c(1,2)],
	G=myG,
	model=("CBLUP"))
#	model=c("GLM", "MLM", "CMLM", "FarmCPU", "Blink", "CBLUP", "SBLUP", "GBLUP"),
#	PCA.total=10,
#	Multiple_analysis=TRUE)
#	model=c("GLM"))
#	PCA.total=3,
#	model=c("GLM", "MLM", "CMLM", "FarmCPU", "Blink"),
#	Multiple_analysis=TRUE)
