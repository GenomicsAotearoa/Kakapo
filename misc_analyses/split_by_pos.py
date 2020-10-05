import os

for i in range(int(155644563/1000000)):
	start = i * 1000000
	end   = ((i + 1) * 1000000) - 1
	outfilename = "1_" + str(start) + "_" + str(end)
	cmd = "bcftools view ./gwas_set_numeric.bcf -r 1:" + str(start) + "-" + str(end)
	cmd += " -Ob -o " + outfilename + ".bcf"
	print(cmd)
	os.system(cmd)

	cmd = "./plink2 --bcf " + outfilename + ".bcf --pca 2 --chr-set 89 --vcf-half-call missing --geno 0.2 --maf 0.05 --out " + outfilename
	print(cmd)
	os.system(cmd)
	
