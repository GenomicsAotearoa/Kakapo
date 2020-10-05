
library(ggplot2)
##Reading in mean site depth
mean_site_depth <- read.delim("/media/jana/Data/kakapo125/vcftools/kakapo_subset.ldepth.mean", header = TRUE, sep = ",")
summary(mean_site_depth)
##Reading in site depth
site_depth <- read.delim("/media/jana/Data/kakapo125/vcftools/kakapo_subset.ldepth", header = TRUE, sep = "\t")
summary(site_depth)
##Reading in missingness
W_missing_sites <- read.delim("/media/jana/Data/kakapo125/KakapoVCFs/vcftools/50maxdepth/missing/ladies.homosites.chrW.lmiss", header = TRUE, sep = "\t")
summary(W_missing_sites)

Z_missing_sites <- read.delim("/media/jana/Data/kakapo125/KakapoVCFs/vcftools/50maxdepth/missing/ladies.chrZ.lmiss", header = TRUE, sep = "\t")
summary(Z_missing_sites)

##Plotting missingness
missing_Wsites_plot <- ggplot(W_missing_sites, aes(F_MISS)) + geom_density(fill ="dark green", colour = "black", alpha = 0.3)
missing_Wsites_plot + theme_light() + labs(title = "Frequency of missingness from sites on the W")

missing_Zsites_plot <- ggplot(Z_missing_sites, aes(F_MISS)) + geom_density(fill ="dark blue", colour = "black", alpha = 0.3)
missing_Zsites_plot + theme_light() + labs(title = "Frequency of missingness from sites on the Z")

missing_Wsites_scatterplot <- ggplot(W_missing_sites, aes(x=POS, y=F_MISS)) + geom_point(size = 1, colour = "dark green", alpha = 0.3)
missing_Wsites_scatterplot + theme_light() + labs(title = "Frequency of missingness across postitions on the W")

missing_Zsites_scatterplot <- ggplot(Z_missing_sites, aes(x=POS, y=F_MISS)) + geom_point(colour = "dark blue", alpha = 0.3)
missing_Zsites_scatterplot + theme_light() + labs(title = "Frequency of missingness across positions on the Z")
