######################################################################################################
#Using the StructuralVariantAnnotation package to merge breakend calls shared across batches of GRIDSS
#calls.
######################################################################################################

##Setup the environment
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install("StructuralVariantAnnotation")
BiocManager::install("circlize")
BiocManager::install("ggbio")
suppressPackageStartupMessages(require(StructuralVariantAnnotation))
suppressPackageStartupMessages(require(VariantAnnotation))
setwd("/media/jana/Data/R_Analysis/GRIDSS")

######################################################################################################
#Loading the VCF files from each batch of GRIDSS.
######################################################################################################

F1vcf <- VariantAnnotation::readVcf("vcf_female/Females_B01.vcf.gz", "/media/jana/Data/kakapo125/genome/kakapo_full_ref.fa")
F2vcf <- VariantAnnotation::readVcf("vcf_female/Females_B02.vcf.gz", "/media/jana/Data/kakapo125/genome/kakapo_full_ref.fa")
F3vcf <- VariantAnnotation::readVcf("vcf_female/Females_B03.vcf.gz", "/media/jana/Data/kakapo125/genome/kakapo_full_ref.fa")
F4vcf <- VariantAnnotation::readVcf("vcf_female/Females_B04.vcf.gz", "/media/jana/Data/kakapo125/genome/kakapo_full_ref.fa")
F5vcf <- VariantAnnotation::readVcf("vcf_female/Females_B05.vcf.gz", "/media/jana/Data/kakapo125/genome/kakapo_full_ref.fa")
F6vcf <- VariantAnnotation::readVcf("vcf_female/Females_B06.vcf.gz", "/media/jana/Data/kakapo125/genome/kakapo_full_ref.fa")
F7vcf <- VariantAnnotation::readVcf("vcf_female/Females_B07.vcf.gz", "/media/jana/Data/kakapo125/genome/kakapo_full_ref.fa")

######################################################################################################
#Creating the breakpoint variables for each batch of females. These are paired
######################################################################################################

F1bpgr <- breakpointRanges(F1vcf)
F2bpgr <- breakpointRanges(F2vcf)
F3bpgr <- breakpointRanges(F3vcf)
F4bpgr <- breakpointRanges(F4vcf)
F5bpgr <- breakpointRanges(F5vcf)
F6bpgr <- breakpointRanges(F6vcf)
F7bpgr <- breakpointRanges(F7vcf)


F1gr <- sort(c(F1begr, F1bpgr))
F1gr[seqnames(F1gr) == "NC_044277.2"]

F1_chrz_breakpoints <- F1gr[seqnames(F1gr) == "NC_044302.2"]

######################################################################################################
#Creating the breakend variables for each batch of females. These do not have a pair.
######################################################################################################



F1begr <- breakendRanges(F1vcf)
F2begr <- breakendRanges(F2vcf)

F2gr <- sort(c(F2begr, F2bpgr))
F2gr[seqnames(F1gr) == "NC_044302.2"]

######################################################################################################

F1_chrz_breakpoints <- F1_chrz_breakpoints[F1_chrz_breakpoints$partner %in% names(F1_chrz_breakpoints)]

countBreakpointOverlaps(F1_chrz_breakpoints, F1_chrz_breakpoints, countOnlyBest = TRUE)

######################################################################################################
suppressPackageStartupMessages(require(circlize))
F1_bpgr_with_chr_prefix <- F1bpgr
#seqlevelsStyle(F1_bpgr_with_chr_prefix) <- "UCSC"
pairs <- breakpointgr2pairs(F1_bpgr_with_chr_prefix)
circos.initializeWithIdeogram()
circos.genomicLink(as.data.frame(S4Vectors::first(pairs)), as.data.frame(S4Vectors::second(pairs)))
circos.clear()

######################################################################################################

suppressPackageStartupMessages(require(ggbio))
gr.circos <- F1bpgr[seqnames(F1bpgr) %in% seqlevels(biovizBase::hg19sub)]
seqlevels(gr.circos) <- seqlevels(biovizBase::hg19sub)
mcols(gr.circos)$to.gr <- granges(partner(gr.circos))

p <- ggbio() +
  circle(gr.circos, geom="link", linked.to="to.gr") +
  circle(biovizBase::hg19sub, geom='ideo', fill='gray70') +
  circle(biovizBase::hg19sub, geom='scale', size=2) +
  circle(biovizBase::hg19sub, geom='text', aes(label=seqnames), vjust=0, size=3)
#> Warning in recycleSingleBracketReplacementValue(value, x, nsbs): number of
#> values supplied is not a sub-multiple of the number of values to be replaced
p
