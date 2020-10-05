library("data.table")
source("http://zzlab.net/GAPIT/GAPIT.library.R")
source("http://zzlab.net/GAPIT/gapit_functions.txt")

myY <- read.table("phenos_gapit.csv", head=TRUE)

#myG <- fread("all_snps.maf.numeric.hapmap.removescaffoldsfornow.hmp.txt", head=FALSE)
myG <- fread("indels_hap.hmp.txt", head=FALSE)
#myG <- fread("S1.hapmap.txt", head=FALSE)

#Y=myY[,c(1,2)]
myGAPIT_MLM <- GAPIT(
	Y=myY,
	G=myG,
#	PCA.total=3,
	model=c("GLM", "MLM", "FarmCPU", "Blink"),
	Multiple_analysis=TRUE)
warnings()
