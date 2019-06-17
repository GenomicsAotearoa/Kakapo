cp freebayes-regions/CM013761.1_10001-20000.vcf template.vcf

for i in freebayes-regions*/*vcf 
do
	vcf-shuffle-cols -t template.vcf $i > $i.shuf.vcf
done

# VCFtools (0.1.17)
vcf-concat freebayes-regions*/*.shuf.vcf > freebayes.concat.vcf
