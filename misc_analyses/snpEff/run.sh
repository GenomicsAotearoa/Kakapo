java -jar snpEff.jar \
	ann \
	-csvStats stats \
	-i VCF \
	-o vcf \
	-s stats.txt \
	-htmlStats stats.html \
	-lof \
	kakapo1.2 \
	Trained_NCBI_renamed.vcf
