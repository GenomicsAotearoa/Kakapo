#!/usr/bin/env Rscript

library(gridExtra)
library(tidyverse)

files <- commandArgs(trailingOnly = TRUE)

# files <- c("simple_36",  "simple_36_TsTv-by-qual", "simple_36_freq",	"simple_36_site-depth", "simple_36_geno-depth", "simple_36_depth", "simple_36_site-mean-depth", "simple_36_TsTv-summary", "simple_36_hist-indel-len", 	"simple_36_TsTv-by-count", "simple_36_missing-site", "simple_36_missing-indv")
# setwd("~/projects/kakapo-genomics/trial_vcfstats/")
# 



basename <- str_remove(files[1],".txt")



for (i in 2:12){
  if(files[i] == paste0(basename, "_freq")){
    freq <- read_tsv(files[i])
  }
  else if(files[i] == paste0(basename, "_TsTv-by-qual")){
    tstv_qual <- read_tsv(files[i])
  }
  else if(files[i] == paste0(basename, "_site-depth")){
    ldepth <- read_tsv(files[i])
  }
  else if(files[i] == paste0(basename, "_geno-depth")){
    gdepth <- read_tsv(files[i])
  }
  else if(files[i] == paste0(basename, "_depth")){
    mean_indiv_depth <- read_tsv(files[i])
  }
  else if(files[i] == paste0(basename, "_site-mean-depth")){
    ldepth_mean <- read_tsv(files[i])
  }
  else if(files[i] == paste0(basename, "_TsTv-summary")){
    tstv_summary <- read_tsv(files[i])
  }
  else if(files[i] == paste0(basename, "_hist-indel-len")){
    indel_hist <- read_tsv(files[i])
  }
  else if(files[i] == paste0(basename, "_TsTv-by-count")){
    tstv_count <- read_tsv(files[i])
  }
  else if(files[i] == paste0(basename, "_missing-site")){
    site_miss <- read_tsv(files[i])
  }
  else if(files[i] == paste0(basename, "_missing-indv")){
    indiv_miss <- read_tsv(files[i])
  }
  else {
    print("Can't find file(s)")
  }
}


# 
# ldepth <- read_tsv(files[1])
# ldepth_mean <- read_tsv(files[2])
# gdepth <- read_tsv(files[3])
# tstv_count <- read_tsv(files[4])
# tstv_qual <- read_tsv(files[5])
# tstv_summary <- read_tsv(files[6])
# indiv_miss <- read_tsv(files[7])
# site_miss <- read_tsv(files[8])
# indel_hist <- read_tsv(files[9])





# ldepth <- read_tsv('~/projects/kakapo-genomics/trial_vcfstats/out.ldepth')
# ldepth_mean <- read_tsv('~/projects/kakapo-genomics/trial_vcfstats/out.ldepth.mean')
# gdepth <- read_tsv('~/projects/kakapo-genomics/trial_vcfstats/out.gdepth')
# tstv_count <- read_tsv('~/projects/kakapo-genomics/trial_vcfstats/out.TsTv.count')
# tstv_qual <- read_tsv('~/projects/kakapo-genomics/trial_vcfstats/out.TsTv.qual')
# tstv_summary <- read_tsv('~/projects/kakapo-genomics/trial_vcfstats/out.TsTv.summary')
# indiv_miss <- read_tsv('~/projects/kakapo-genomics/trial_vcfstats/out.imiss')
# site_miss <- read_tsv('~/projects/kakapo-genomics/trial_vcfstats/out.lmiss')
# indel_hist <- read_tsv('~/projects/kakapo-genomics/trial_vcfstats/out.indel.hist')


# Gdepth doesn't seem that helpful


# Indel summary
indels_plot <- ggplot(data = indel_hist, aes(x = LENGTH, y = COUNT)) +
  geom_bar(stat = 'identity') +
  scale_y_log10(breaks = c(0,1,10,100,1000,10000,100000,1000000), labels = c(0,1,10,100,1000,bquote(1^4),bquote(1^5),bquote(1^6)))



# Individual missing rate
mean(indiv_miss$F_MISS)

indiv_miss <- indiv_miss %>%
  arrange(desc(F_MISS))



indiv_miss_plot <-  ggplot(data = indiv_miss, aes(x = as_factor(INDV), y = F_MISS)) +
  geom_bar(stat = 'identity') +
  labs(x = "Individual", y = "Missing rate")+
  theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.3, size = 12))


# ldepth_mean. Log10 transformation may not be ideal
mean_site_depth <- ggplot(data = ldepth_mean, aes(x = MEAN_DEPTH)) +
  geom_histogram(binwidth = 30) +
  scale_y_log10()

# Site missingness
site_missing_rate <- ggplot(data = site_miss, aes(x = F_MISS)) +
  geom_histogram(binwidth = 0.01)

# tstv count
tstv_count <- ggplot(data = tstv_count, aes(x = ALT_ALLELE_COUNT, y = `Ts/Tv`)) +
  geom_bar(stat = 'identity')


pdf(paste0(basename, "_vcfstats.pdf"))
plot(indels_plot)
plot(indiv_miss_plot)
plot(mean_site_depth)
plot(site_missing_rate)
plot(tstv_count)
dev.off()
