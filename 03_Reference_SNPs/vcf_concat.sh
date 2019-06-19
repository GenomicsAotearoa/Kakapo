cp freebayes-regions/CM013761.1_10001-20000.vcf template.vcf

# for i in freebayes-regions*/*vcf 
# do
# 	vcf-shuffle-cols -t template.vcf $i > $i.shuf.vcf
# done

# for i in vcfs/*.vcf
#do
#	bgzip -i --threads 16 -l 9 $i
#done

# for i in vcfs/*.gz
# do
# 	bcftools index --threads 16 -f $i
# done

ls vcfs/*.vcf.gz | sort -V > ./vcf.list

# VCFtools (0.1.17)
# vcf-concat -f vcf.list > freebayes.concat.vcf

#  bcftools 1.9-57-gcf72059
#  Using htslib 1.9-44-g80f3557
#  Copyright (C) 2018 Genome Research Ltd.
#  License Expat: The MIT/Expat license
#  This is free software: you are free to change and redistribute it.
#  There is NO WARRANTY, to the extent permitted by law.

bcftools concat -l -f vcf.list -o freebayes.concat.vcf -O v --threads 16
