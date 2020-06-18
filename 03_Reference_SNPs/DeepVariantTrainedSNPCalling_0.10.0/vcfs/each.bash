for i in *.gvcf
do
	bcftools view ${i} -Ob -o ${i}.bcf
done
