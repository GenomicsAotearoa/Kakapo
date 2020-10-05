library("data.table")
source("http://zzlab.net/GAPIT/GAPIT.library.R")
source("http://zzlab.net/GAPIT/gapit_functions.txt")

myY <- read.table("../phenos_gapit.csv", head=TRUE)

myG <- fread("../all_snps.maf.numeric.hapmap.removescaffoldsfornow.hmp.txt", head=FALSE)

#Y=myY[,c(1,2)]
myGAPIT_MLM <- GAPIT(
	Y=myY[,c(1,3,4,5)],
	G=myG,
#	PCA.total=3,
	model=c("GLM", "MLM", "CMLM", "FarmCPU", "Blink"),
	Multiple_analysis=TRUE)
warnings()
