#!/usr/bin/bash

# Conda vcflib
# conda activate vcflib
# cat freebayes-regions/* | vcffirstheader | vcfstreamsort -w 1000 | vcfuniq |  vcffilter -f "QUAL > 20" > testing.vcf

# cat testing.vcf | vcfallelicprimitives -kg | vcffilter -f "QUAL > 30" > testing.filtered.vcf

# module load PLINK

# Convert to simple allele?

# plink --allow-extra-chr --vcf testing.filtered.vcf --out testing


# Conda faststructure (but had to install manually too...)
conda activate faststructure
for i in $(seq 1 20);
do
	python /nesi/project/uoo02695/software/fastStructure/structure.py -K $i --input=plink2_pruned --output=faststructure/dv_plink2_pruned
done
