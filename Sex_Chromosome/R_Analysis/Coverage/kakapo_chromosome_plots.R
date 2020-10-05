setwd("/media/jana/Data/R_Analysis/Kakapo")
library(ggplot2)

##Reading in mean site depth
FmeansitedepthChr5ZW <- read.delim("/media/jana/Data/kakapo125/KakapoVCFs/vcftools/50maxdepth/for_plotting/ladies.maxdepth50.homosites.chr5ZWsexed.meandepth", header = TRUE, sep = "\t")
Fmeandepth_Chr5 <- read.delim("/media/jana/Data/kakapo125/KakapoVCFs/vcftools/50maxdepth/for_plotting/ladies.maxdepth50.homosites.chr5sexed.meandepth", header = TRUE, sep = "\t")
Fmeandepth_ChrZ <- read.delim("/media/jana/Data/kakapo125/KakapoVCFs/vcftools/50maxdepth/for_plotting/ladies.maxdepth50.homosites.chrZsexed.meandepth", header = TRUE, sep = "\t")
Fmeandepth_ChrW <- read.delim("/media/jana/Data/kakapo125/KakapoVCFs/vcftools/50maxdepth/for_plotting/ladies.maxdepth50.homosites.chrWsexed.meandepth", header = TRUE, sep = "\t")
Fmeandepth_ChrW_malesitesremoved <- read.delim("/media/jana/Data/kakapo125/KakapoVCFs/vcftools/ladies.maxdepth50.homosites.finalChrW.ldepth.mean", header = TRUE, sep = "\t")

MvF_meandepth_Chr5ZW <- read.delim("/media/jana/Data/kakapo125/KakapoVCFs/vcftools/50maxdepth/for_plotting/keyindivs.chr5ZWsexed.meandepth", header = TRUE, sep = "\t")

#MalevFemale chromosome depth comparisons

boxplot_MvF_Chr5ZW <- ggplot(MvF_meandepth_Chr5ZW, aes(x=sex, y=mean_depth, color=chrom)) + geom_boxplot()
boxplot_MvF_Chr5ZW + labs(title = "Male vs Female mean homozygous site depth") + theme_light()


##Plotting mean site depth
FmeansiteChr5ZW_scatterplot <- ggplot(FmeansitedepthChr5ZW, aes(x=pos, y=mean_depth, color=chrom)) + geom_point(size = 0.25, alpha = 0.3)
FmeansiteChr5ZW_boxplot <- ggplot(FmeansitedepthChr5ZW, aes(x=pos, y=mean_depth, color=chrom)) + geom_boxplot()
FmeansiteChr5ZW_scatterplot + theme_light()
FmeansiteChr5ZW_boxplot + theme_light()

plot_meandepth5 <- ggplot(Fmeandepth_Chr5, aes(x=pos, y=mean_depth)) + geom_point(size=0.5, colour="gold")
plot_meandepth5 + labs(title = "Chromosome 5") + theme_light()
plot_meandepthZ <-ggplot(Fmeandepth_ChrZ, aes(x=pos, y=mean_depth)) + geom_point(size=0.5, colour="dark blue")
plot_meandepthZ + labs(title = "Z Chromosome") + theme_light()
plot_meandepthW <-ggplot(Fmeandepth_ChrW, aes(x=pos, y=mean_depth)) + geom_point(size=0.5, colour="dark green")
plot_meandepthW + labs(title = "W Chromosome") + theme_light()

plot_meandepthW_malesremoved <-ggplot(Fmeandepth_ChrW_malesitesremoved, aes(x=POS, y=MEAN_DEPTH)) + geom_point(size=0.5, colour="dark green")
plot_meandepthW_malesremoved + labs(title = "W Chromosome: Male sites removed") + theme_light()


