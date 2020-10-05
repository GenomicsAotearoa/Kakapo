if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install("StructuralVariantAnnotation")
BiocManager::install("rtracklayer")

library(StructuralVariantAnnotation)

#vcf1 = readVcf("vcf_female/Females_B01.vcf.gz")
#vcf2 = readVcf("vcf_female/Females_B02.vcf.gz")
#vcf3 = readVcf("vcf_female/Females_B03.vcf.gz")
#vcf4 = readVcf("vcf_female/Females_B04.vcf.gz")
#vcf5 = readVcf("vcf_female/Females_B05.vcf.gz")
#vcf6 = readVcf("vcf_female/Females_B06.vcf.gz")
#vcf7 = readVcf("vcf_female/Females_B07.vcf.gz")

#male_vcf1 = readVcf("vcf_male/males_B01.vcf.gz")
#male_vcf2 = readVcf("vcf_male/males_B02.vcf.gz")
#male_vcf3 = readVcf("vcf_male/males_B03.vcf.gz")
#male_vcf4 = readVcf("vcf_male/males_B04.vcf.gz")
#male_vcf5 = readVcf("vcf_male/males_B05.vcf.gz")
#male_vcf6 = readVcf("vcf_male/males_B06.vcf.gz")
#male_vcf7 = readVcf("vcf_male/males_B07.vcf.gz")
#male_vcf8 = readVcf("vcf_male/males_B08.vcf.gz")
#male_vcf9 = readVcf("vcf_male/males_B09.vcf.gz")

# Export breakpoints to BEDPE
#bpgr1 = breakpointRanges(vcf1)
#bpgr2 = breakpointRanges(vcf2)
#bpgr3 = breakpointRanges(vcf3)
#bpgr4 = breakpointRanges(vcf4)
#bpgr5 = breakpointRanges(vcf5)
#bpgr6 = breakpointRanges(vcf6)
#bpgr7 = breakpointRanges(vcf7)

#male_bpgr1 = breakpointRanges(male_vcf1)
#male_bpgr2 = breakpointRanges(male_vcf2)
#male_bpgr3 = breakpointRanges(male_vcf3)
#male_bpgr4 = breakpointRanges(male_vcf4)
#male_bpgr5 = breakpointRanges(male_vcf5)
#male_bpgr6 = breakpointRanges(male_vcf6)
#male_bpgr7 = breakpointRanges(male_vcf7)
#male_bpgr8 = breakpointRanges(male_vcf8)
#male_bpgr9 = breakpointRanges(male_vcf9)

# TODO: add your event filtering here. The default GRIDSS output is very verbose/sensitive.
#write.table(breakpointgr2bedpe(bpgr1), file="Female_B01_breakpoints.bedpe", sep="\t", quote=FALSE, col.names=FALSE)
#write.table(breakpointgr2bedpe(bpgr2), file="Female_B02_breakpoints.bedpe", sep="\t", quote=FALSE, col.names=FALSE)
#write.table(breakpointgr2bedpe(bpgr3), file="Female_B03_breakpoints.bedpe", sep="\t", quote=FALSE, col.names=FALSE)
#write.table(breakpointgr2bedpe(bpgr4), file="Female_B04_breakpoints.bedpe", sep="\t", quote=FALSE, col.names=FALSE)
#write.table(breakpointgr2bedpe(bpgr5), file="Female_B05_breakpoints.bedpe", sep="\t", quote=FALSE, col.names=FALSE)
#write.table(breakpointgr2bedpe(bpgr6), file="Female_B06_breakpoints.bedpe", sep="\t", quote=FALSE, col.names=FALSE)
#write.table(breakpointgr2bedpe(bpgr7), file="Female_B07_breakpoints.bedpe", sep="\t", quote=FALSE, col.names=FALSE)

#write.table(breakpointgr2bedpe(male_bpgr1), file="Male_B01_breakpoints.bedpe", sep="\t", quote=FALSE, col.names=FALSE)
#write.table(breakpointgr2bedpe(male_bpgr2), file="Male_B02_breakpoints.bedpe", sep="\t", quote=FALSE, col.names=FALSE)
#write.table(breakpointgr2bedpe(male_bpgr3), file="Male_B03_breakpoints.bedpe", sep="\t", quote=FALSE, col.names=FALSE)
#write.table(breakpointgr2bedpe(male_bpgr4), file="Male_B04_breakpoints.bedpe", sep="\t", quote=FALSE, col.names=FALSE)
#write.table(breakpointgr2bedpe(male_bpgr5), file="Male_B05_breakpoints.bedpe", sep="\t", quote=FALSE, col.names=FALSE)
#write.table(breakpointgr2bedpe(male_bpgr6), file="Male_B06_breakpoints.bedpe", sep="\t", quote=FALSE, col.names=FALSE)
#write.table(breakpointgr2bedpe(male_bpgr7), file="Male_B07_breakpoints.bedpe", sep="\t", quote=FALSE, col.names=FALSE)
#write.table(breakpointgr2bedpe(male_bpgr8), file="Male_B08_breakpoints.bedpe", sep="\t", quote=FALSE, col.names=FALSE)
#write.table(breakpointgr2bedpe(male_bpgr9), file="Male_B09_breakpoints.bedpe", sep="\t", quote=FALSE, col.names=FALSE)

# Export single breakends to BED
#begr1 = breakendRanges(vcf1)
#begr2 = breakendRanges(vcf2)
#begr3 = breakendRanges(vcf3)
#begr4 = breakendRanges(vcf4)
#begr5 = breakendRanges(vcf5)
#begr6 = breakendRanges(vcf6)
#begr7 = breakendRanges(vcf7)

#male_begr1 = breakendRanges(male_vcf1)
#male_begr2 = breakendRanges(male_vcf2)
#male_begr3 = breakendRanges(male_vcf3)
#male_begr4 = breakendRanges(male_vcf4)
#male_begr5 = breakendRanges(male_vcf5)
#male_begr6 = breakendRanges(male_vcf6)
#male_begr7 = breakendRanges(male_vcf7)
#male_begr8 = breakendRanges(male_vcf8)
#male_begr9 = breakendRanges(male_vcf9)

# TODO: add your event filtering here. The default GRIDSS output is very verbose/sensitive.
#begr1$score = begr1$QUAL
#begr2$score = begr2$QUAL
#begr3$score = begr3$QUAL
#begr4$score = begr4$QUAL
#begr5$score = begr5$QUAL
#begr6$score = begr6$QUAL
#begr7$score = begr7$QUAL

#male_begr1$score = male_begr1$QUAL
#male_begr2$score = male_begr2$QUAL
#male_begr3$score = male_begr3$QUAL
#male_begr4$score = male_begr4$QUAL
#male_begr5$score = male_begr5$QUAL
#male_begr6$score = male_begr6$QUAL
#male_begr7$score = male_begr7$QUAL
#male_begr8$score = male_begr8$QUAL
male_begr9$score = male_begr9$QUAL

#export(begr1, con="Female_B01_single_breakends.bed")
#export(begr2, con="Female_B02_single_breakends.bed")
#export(begr3, con="Female_B03_single_breakends.bed")
#export(begr4, con="Female_B04_single_breakends.bed")
#export(begr5, con="Female_B05_single_breakends.bed")
#export(begr6, con="Female_B06_single_breakends.bed")
#export(begr7, con="Female_B07_single_breakends.bed")

#export(male_begr1, con="Male_B01_single_breakends.bed")
#export(male_begr2, con="Male_B02_single_breakends.bed")
#export(male_begr3, con="Male_B03_single_breakends.bed")
#export(male_begr4, con="Male_B04_single_breakends.bed")
#export(male_begr5, con="Male_B05_single_breakends.bed")
#export(male_begr6, con="Male_B06_single_breakends.bed")
#export(male_begr7, con="Male_B07_single_breakends.bed")
#export(male_begr8, con="Male_B08_single_breakends.bed")
export(male_begr9, con="Male_B09_single_breakends.bed")