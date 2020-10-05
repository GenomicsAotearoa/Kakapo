setwd("/media/jana/Data/R_Analysis/Kakapo")
library(ggplot2)

##Reading in mean site depth
SNP_den <- read.delim("/media/jana/Data/Trained_SNPs.snpden", header = TRUE, sep = "\t")
C1 <- read.delim("/media/jana/Data/C1.snpden", header = TRUE, sep = "\t")
C2 <- read.delim("/media/jana/Data/S2.snpden", header = TRUE, sep = "\t")
C3 <- read.delim("/media/jana/Data/S3.snpden", header = TRUE, sep = "\t")
C13 <- read.delim("/media/jana/Data/S13.snpden", header = TRUE, sep = "\t")

head(SNP_den)
tail(SNP_den)

ggplot(C1, aes(x=BIN_START, y=SNP_COUNT, fill=CHROM, color=CHROM)) + geom_line() + theme_light() + geom_line(data=C2)
ggplot(C2, aes(x=BIN_START, y=SNP_COUNT, fill=CHROM, color=CHROM)) + geom_line() + theme_light()
ggplot(C3, aes(x=BIN_START, y=SNP_COUNT, fill=CHROM, color=CHROM)) + geom_line() + theme_light()
ggplot(C13, aes(x=BIN_START, y=SNP_COUNT, fill=CHROM, color=CHROM)) + geom_line() + theme_light()
