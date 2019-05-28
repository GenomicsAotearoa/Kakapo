for i in *.vcf
do
	bgzip -i $i
done

for i in *.gz
do
	bcftools index $i
done

bcftools merge -O b -o merged_dv_pass1.bcf --threads 32 *vcf.gz
