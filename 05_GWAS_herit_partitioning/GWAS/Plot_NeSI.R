#install.packages("qqman")
library(qqman)
library(stringr)
library(fdrtool)

# module load  R/3.5.3-gimkl-2018b

setwd('/nesi/nobackup/uoo02695/Kakapo/05_GWAS_herit_partitioning/GWAS/')

args <- commandArgs(trailingOnly = TRUE) # plink/GWAS_plum.Plumage.glm.logistic plum fdr; plink/batch/GWAS_clo.Cloacitis_pheno.glm.logistic clo_batch_fdr fdr
# args = c('plink/batch/GWAS_clo.Cloacitis_pheno.glm.logistic', 'clo_batch_fdr', 'fdr')

dat = read.table(as.character(args[1]))
head = as.character(args[2])
thre = as.character(args[3])

dat = dat[!is.na(dat$V14), ]

dat = dat[dat$V1!=3,]
dat = dat[dat$V1!=13,]

dat = dat[dat$V7 == 'ADD',]
dat = dat[order(-dat$V1),] 

#which(dat$V14 == min(dat$V14))
#dat$V3[which(dat$V14 == min(dat$V14))]
#dim(dat)[1]

if (thre == 'Bonferroni') {
  threh = -log10(0.05/dim(dat)[1])
} else if (thre == 'fdr') {
  threhs = fdrtool(dat$V14, statistic="pvalue", plot=FALSE, verbose=FALSE)$qval
  threh = dat$V14[which(threhs == max(threhs[threhs<=0.05]))]
} else if (thre == 'LD') {
  threh = -log10(0.05/85995)
}
  
jpeg(paste('/nesi/nobackup/uoo02695/Kakapo/05_GWAS_herit_partitioning/GWAS/plink/Manh_',head,'.jpg',sep=''), width = 640, 
     height = 480)
manhattan(dat, chr = "V1", bp = "V2", p = "V14", snp = "V3", col=c("blue4", "orange3"), 
          ylim = c(0, (-log10(min(dat$V14)) + 1)), cex = 0.6, suggestiveline = F, 
          cex.axis = 0.9, genomewideline = threh, highlight = as.character(dat$V3[which(dat$V14 == min(dat$V14))][1])) 
dev.off()

# inflation with QQperm
#z=qnorm(dat$V14/2)
#lambda = round(median(z^2,na.rm=T)/qchisq(0.5,df=1),3)

#chisq <- qchisq(dat$V14/2, 1, lower.tail = F)
#lambda <- median(chisq) / qchisq(0.5,1)


chisq <- qchisq(1-dat$V14,1)
lambda = median(chisq)/qchisq(0.5,1)


jpeg(paste('/nesi/nobackup/uoo02695/Kakapo/05_GWAS_herit_partitioning/GWAS/plink/QQ_',head,'.jpg',sep=''))
qq(dat$V14, main = paste("QQ plot; Genomic inflation = ", lambda, sep=''), xlim = c(0, 11), ylim = c(0,11), 
   pch = 18, col = "blue4", cex = 1.5, las = 1)
dev.off()


