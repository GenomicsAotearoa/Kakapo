##################################################################################################################
# Here I'm trying to see if there's a size bias in the structural variants that come up with mendelian inheritance
# issues.
##################################################################################################################
library("ggplot2")
library("ggridges")
library("ggpubr")
library("gridExtra")
setwd("/media/jana/Data/R_Analysis/MANTA")
sizes <- read.table("Mendelian_Site_Sizes2plot.tsv", sep = "\t", header = FALSE) #File does not include DUP or BND
sizes[4] <- lapply(sizes[4], abs)
sizes

all_sv <- read.table("all_trio_tested.tsv", sep = "\t", header = FALSE) #Sizes aren't available for DUP or BND. 
all_sv

pass <- all_sv[ all_sv$V4 == "Passed_Site" ,]
pass

het <- read.table("TRIAL_FAM.HETERO", sep = "\t", header = TRUE)

INV_size <- sizes[ sizes$V3 == "MantaINV" , ]
INS_size <- sizes[ sizes$V3 == "MantaINS" , ]
DEL_size <- sizes[ sizes$V3 == "MantaDEL" , ]
passedINV <- INV_size[ INV_size$V5 == "Passed_Site" , ]
passedINS <- INS_size[ INS_size$V5 == "Passed_Site" , ]
passedDEL <- DEL_size[ DEL_size$V5 == "Passed_Site" , ]

c01 <- all_sv[ all_sv$V1 == "S01" ,]
c02 <- all_sv[ all_sv$V1 == "S02" ,]
c03 <- all_sv[ all_sv$V1 == "S04" ,]
c04 <- all_sv[ all_sv$V1 == "S05" ,]
c05 <- all_sv[ all_sv$V1 == "S06" ,]
c06 <- all_sv[ all_sv$V1 == "S07" ,]
c07 <- all_sv[ all_sv$V1 == "S08" ,]
c08 <- all_sv[ all_sv$V1 == "S09" ,]
c09 <- all_sv[ all_sv$V1 == "S10" ,]
c10 <- all_sv[ all_sv$V1 == "S11" ,]
c11 <- all_sv[ all_sv$V1 == "S12" ,]
c12 <- all_sv[ all_sv$V1 == "S14" ,]
c13 <- all_sv[ all_sv$V1 == "S15" ,]
c14 <- all_sv[ all_sv$V1 == "S16" ,]
c15 <- all_sv[ all_sv$V1 == "S17" ,]
c16 <- all_sv[ all_sv$V1 == "S18" ,]
c17 <- all_sv[ all_sv$V1 == "S19" ,]
c18 <- all_sv[ all_sv$V1 == "S20" ,]
c19 <- all_sv[ all_sv$V1 == "S21" ,]
c20 <- all_sv[ all_sv$V1 == "S22" ,]
c21 <- all_sv[ all_sv$V1 == "S23" ,]
c22 <- all_sv[ all_sv$V1 == "S24" ,]
c23 <- all_sv[ all_sv$V1 == "S25" ,]

pass_c01 <- pass[ pass$V1 == "S01" ,]
pass_c02 <- pass[ pass$V1 == "S02" ,]
pass_c03 <- pass[ pass$V1 == "S04" ,]
pass_c04 <- pass[ pass$V1 == "S05" ,]
pass_c05 <- pass[ pass$V1 == "S06" ,]
pass_c06 <- pass[ pass$V1 == "S07" ,]
pass_c07 <- pass[ pass$V1 == "S08" ,]
pass_c08 <- pass[ pass$V1 == "S09" ,]
pass_c09 <- pass[ pass$V1 == "S10" ,]
pass_c10 <- pass[ pass$V1 == "S11" ,]
pass_c11 <- pass[ pass$V1 == "S12" ,]
pass_c12 <- pass[ pass$V1 == "S14" ,]
pass_c13 <- pass[ pass$V1 == "S15" ,]
pass_c14 <- pass[ pass$V1 == "S16" ,]
pass_c15 <- pass[ pass$V1 == "S17" ,]
pass_c16 <- pass[ pass$V1 == "S18" ,]
pass_c17 <- pass[ pass$V1 == "S19" ,]
pass_c18 <- pass[ pass$V1 == "S20" ,]
pass_c19 <- pass[ pass$V1 == "S21" ,]
pass_c20 <- pass[ pass$V1 == "S22" ,]
pass_c21 <- pass[ pass$V1 == "S23" ,]
pass_c22 <- pass[ pass$V1 == "S24" ,]
pass_c23 <- pass[ pass$V1 == "S25" ,]

####################################################################################################
# Histogram of all SV size ranges

ggplot(sizes, aes(x=sizes$V4, fill=sizes$V5)) +
  geom_histogram(binwidth = 50) +
  xlim(50,10000) +
  ylim(0,60) +
  labs(x = "Variant Size", y = "Count", title = "All Variants 50bp - 10kb (n = 779)") +
  scale_fill_discrete(name="Trio Result") +
  theme_light()

inv1 <- ggplot(passedINV, aes(x=passedINV$V4, fill=passedINV$V1)) +
  geom_histogram(binwidth = 100) +
  labs(x = "Inversion Size", y = "Count", title = "Inversions 0.8kb - 2.8kb (n = 14)") +
  scale_fill_discrete(name = "Chromosome") +
  xlim(500,3000) +
  ylim(0,3) +
  theme_light()
inv2 <- ggplot(passedINV, aes(x=passedINV$V4, fill=passedINV$V1)) +
  geom_histogram(binwidth = 100) +
  labs(x = "Inversion Size", y = "Count", title = "Inversions 8.7 - 9.1kb (n = 2)") +
  scale_fill_discrete(name = "Chromosome") +
  xlim(8000,10000) +
  ylim(0,3) +
  theme_light()
inv3 <- ggplot(passedINV, aes(x=passedINV$V4, fill = passedINV$V1)) +
  geom_histogram(binwidth = 100) +
  labs(x = "Inversion Size", y = "Count", title = "Inversions 50 - 60kb (n = 3)") +
  scale_fill_discrete(name = "Chromosome") +
  xlim(51000,60000) +
  ylim(0,3) +
  theme_light()

inv <- grid.arrange(inv1, inv2, inv3, nrow = 1)
inv

del1 <- ggplot(passedDEL, aes(x=passedDEL$V4, fill = passedDEL$V1)) +
  geom_histogram(binwidth = 500) +
  labs(x = "Inversion Size", y = "Count", title = "Deletions 50bp - 18kb (n = 109)") +
  scale_fill_discrete(name = "Chromosome") +
  xlim(0,18000) +
  ylim(0,15) +
  theme_light()
del1 #There's 1 deletion that's 149746bp on chromosome 2

#del2 <- ggplot(passedDEL, aes(x=passedDEL$V4, Fill = passedDEL$V1)) +
#  geom_histogram(binwidth = 500) +
#  labs(x = "Inversion Size", y = "Count", title = "Deletions 100 - 150kb") +
#  scale_fill_discrete(name = "Chromosome") +
#  xlim(100000,150000) +
#  ylim(0,15) +
#  theme_light()

ggplot(passedINS, aes(x=passedINS$V4, fill=passedINS$V1)) +
  geom_histogram(binwidth = 50) +
  labs(x = "Insertion Size", y = "Count", title = "Insertions 50 - 600bp (n = 31)") +
  scale_fill_discrete(name = "Chromosome") +
  theme_light() +
  xlim(0,625) +
  ylim(0,13)

##################################################################################################################
# Relative proportion of SV's that passed the trio test

ggplot(all_sv, aes(x=all_sv$V4, fill=all_sv$V3)) + 
  geom_bar(position = "fill") +
  labs(x = "Structural Variant", y = "Proportion of Calls", title = "All Variants 50 - 600kb (n = 852)") +
  coord_flip() +
  theme_light() +
  scale_fill_discrete(name = "Trio Result")

##################################################################################################################
# Plotting SV proportion / chromosome
pass
ggplot(pass, aes(x=pass$V1, fill = pass$V3)) +
  geom_bar(alpha = 0.8, position = "fill") +
  labs(x = "Chromosome", y = "Proportion of Representative SV's", title = "Proportion of Structural Variants per Chromosome") +
  scale_fill_discrete(name = "Structural Variant Type") +
  theme_light()

ggplot(pass, aes(x=pass$V2, y=pass$V1, fill=pass$V3)) +
  geom_density_ridges(alpha = 0.5, stat = "binline") +
  labs(x = "Position along chromosome", y = "Count", title = "Structural Variant postions along autosomes") +
  scale_fill_discrete(name="Structural Variant Type") +
  theme_ridges()

##################################################################################################################
# Plotting passing sites only

pass_s01 <- ggplot(pass_c01, aes(x=pass_c01$V2, y=pass_c01$V3, fill=pass_c01$V3)) +
  geom_density_ridges(alpha = 0.5, stat = "binline") +
  labs(x = "Position on S1", y = "Count", title = "SV's 50bp - 600kb (n = 41) on S1") +
  scale_fill_discrete(name="Trio Result") +
  theme_ridges()

pass_s02 <- ggplot(pass_c02, aes(x=pass_c02$V2, y=pass_c02$V3, fill=pass_c02$V3)) +
  geom_density_ridges(alpha = 0.5, stat = "binline") +
  labs(x = "Position on S2", y = "Count", title = "SV's 50bp - 600kb (n = 27) on S2") +
  scale_fill_discrete(name="Trio Result") +
  theme_ridges()

pass_s04 <- ggplot(pass_c03, aes(x=pass_c03$V2, y=pass_c03$V3, fill=pass_c03$V3)) +
  geom_density_ridges(alpha = 0.5, stat = "binline") +
  labs(x = "Position on S4", y = "Count", title = "SV's 50bp - 600kb (n = 20) on S4") +
  scale_fill_discrete(name="Trio Result") +
  theme_ridges()

pass_s05 <- ggplot(pass_c04, aes(x=pass_c04$V2, y=pass_c04$V3, fill=pass_c04$V3)) +
  geom_density_ridges(alpha = 0.5, stat = "binline") +
  labs(x = "Position on S5", y = "Count", title = "SV's 50bp - 600kb (n = 15) on S5") +
  scale_fill_discrete(name="Trio Result") +
  theme_ridges()

pass_s06 <- ggplot(pass_c05, aes(x=pass_c05$V2, y=pass_c05$V3, fill=pass_c05$V3)) +
  geom_density_ridges(alpha = 0.5, stat = "binline") +
  labs(x = "Position on S6", y = "Count", title = "SV's 50bp - 600kb (n = 14) on S6") +
  scale_fill_discrete(name="Trio Result") +
  theme_ridges()

pass_s07 <- ggplot(pass_c06, aes(x=pass_c06$V2, y=pass_c06$V3, fill=pass_c06$V3)) +
  geom_density_ridges(alpha = 0.5, stat = "binline") +
  labs(x = "Position on S7", y = "Count", title = "SV's 50bp - 600kb (n = 14) on S7") +
  scale_fill_discrete(name="Trio Result") +
  theme_ridges()

pass_s08 <- ggplot(pass_c07, aes(x=pass_c07$V2, y=pass_c07$V3, fill=pass_c07$V3)) +
  geom_density_ridges(alpha = 0.5, stat = "binline") +
  labs(x = "Position on S8", y = "Count", title = "SV's 50bp - 600kb (n = 12) on S8") +
  scale_fill_discrete(name="Trio Result") +
  theme_ridges()

pass_s09 <- ggplot(pass_c08, aes(x=pass_c08$V2, y=pass_c08$V3, fill=pass_c08$V3)) +
  geom_density_ridges(alpha = 0.5, stat = "binline") +
  labs(x = "Position on S9", y = "Count", title = "SV's 50bp - 600kb (n = 6) on S9") +
  scale_fill_discrete(name="Trio Result") +
  theme_ridges()

pass_s10 <- ggplot(pass_c09, aes(x=pass_c09$V2, y= pass_c09$V3, fill=pass_c09$V3)) +
  geom_density_ridges(alpha = 0.5, stat = "binline") +
  labs(x = "Position on S10", y = "Count", title = "SV's 50bp - 600kb (n = 3) on S10") +
  scale_fill_discrete(name="Trio Result") +
  theme_ridges()

pass_s11 <- ggplot(pass_c10, aes(x=pass_c10$V2, y= pass_c10$V3, fill=pass_c10$V3)) +
  geom_density_ridges(alpha = 0.5, stat = "binline") +
  labs(x = "Position on S11", y = "Count", title = "SV's 50bp - 600kb (n = 3) on S11") +
  scale_fill_discrete(name="Trio Result") +
  theme_ridges()

pass_s12 <- ggplot(pass_c11, aes(x=pass_c11$V2, y= pass_c11$V3, fill=pass_c11$V3)) +
  geom_density_ridges(alpha = 0.5, stat = "binline") +
  labs(x = "Position on S12", y = "Count", title = "SV's 50bp - 600kb (n = 4) on S12") +
  scale_fill_discrete(name="Trio Result") +
  theme_ridges()

pass_s14 <- ggplot(pass_c12, aes(x=pass_c12$V2, y= pass_c12$V3, fill=pass_c12$V3)) +
  geom_density_ridges(alpha = 0.5, stat = "binline") +
  labs(x = "Position on S14", y = "Count", title = "SV's 50bp - 600kb (n = 10) on S14") +
  scale_fill_discrete(name="Trio Result") +
  theme_ridges()

pass_s15 <- ggplot(pass_c13, aes(x=pass_c13$V2, y= pass_c13$V3, fill=pass_c13$V3)) +
  geom_density_ridges(alpha = 0.5, stat = "binline") +
  labs(x = "Position on S15", y = "Count", title = "SV's 50bp - 600kb (n = 2) on S15") +
  scale_fill_discrete(name="Trio Result") +
  theme_ridges()

pass_s16 <- ggplot(pass_c14, aes(x=pass_c14$V2, y= pass_c14$V3, fill=pass_c14$V3)) +
  geom_density_ridges(alpha = 0.5, stat = "binline") +
  labs(x = "Position on S16", y = "Count", title = "SV's 50bp - 600kb (n = 7) on S16") +
  scale_fill_discrete(name="Trio Result") +
  theme_ridges()

pass_s17 <- ggplot(pass_c15, aes(x=pass_c15$V2, y= pass_c15$V3, fill=pass_c15$V3)) +
  geom_density_ridges(alpha = 0.5, stat = "binline") +
  labs(x = "Position on S17", y = "Count", title = "SV's 50bp - 600kb (n = 1) on S17") +
  scale_fill_discrete(name="Trio Result") +
  theme_ridges()

pass_s19 <- ggplot(pass_c17, aes(x=pass_c17$V2, y= pass_c17$V3, fill=pass_c17$V3)) +
  geom_density_ridges(alpha = 0.5, stat = "binline") +
  labs(x = "Position on S19", y = "Count", title = "SV's 50bp - 600kb (n = 2) on S19") +
  scale_fill_discrete(name="Trio Result") +
  theme_ridges()

pass_s20 <- ggplot(pass_c18, aes(x=pass_c18$V2, y= pass_c18$V3, fill=pass_c18$V3)) +
  geom_density_ridges(alpha = 0.5, stat = "binline") +
  labs(x = "Position on S20", y = "Count", title = "SV's 50bp - 600kb (n = 2) on S20") +
  scale_fill_discrete(name="Trio Result") +
  theme_ridges()


pass_s22 <- ggplot(pass_c20, aes(x=pass_c20$V2, y=pass_c20$V3, fill=pass_c20$V3)) +
  geom_density_ridges(alpha = 0.5, stat = "binline") +
  labs(x = "Position on S22", y = "Count", title = "SV's 50bp - 600kb (n = 3) on S22") +
  scale_fill_discrete(name="Trio Result") +
  theme_ridges()

pass_s23 <- ggplot(pass_c21, aes(x=pass_c21$V2, y=pass_c21$V3, fill=pass_c21$V3)) +
  geom_density_ridges(alpha = 0.5, stat = "binline", position = "fill") +
  labs(x = "Position on S23", y = "Count", title = "SV's 50bp - 600kb (n = 5) on S23") +
  scale_fill_discrete(name="Trio Result") +
  theme_ridges()

grid.arrange(pass_s01, pass_s02, pass_s04, pass_s05, nrow = 2)

##################################################################################################################
# Plotting passed SV heterozygocity
het
ggplot(het, aes(x=INDV, y=F)) +
  geom_point(aes(color = Data, size = 24)) +
  labs(x = "F", title = "Changes in VCFtools F statistic") +
  theme_light()
