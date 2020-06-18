ch = Channel.fromPath("*.vcf")

process plot {
	publishDir 'output'
	input: 
		file vcf from ch
	output: 
		file "${vcf.baseName}.pdf"
		file "${vcf.baseName}.png"
	"""
	nice /scale_wlg_nobackup/filesets/nobackup/uoo02695/software/PopLDdecay-3.40/bin/PopLDdecay -MaxDist 1000 -MAF 0.005 -OutStat ${vcf.baseName} -InVCF ${vcf}
	perl /scale_wlg_nobackup/filesets/nobackup/uoo02695/software/PopLDdecay-3.40/bin/Plot_OnePop.pl -inFile ${vcf.baseName}.stat.gz -output ${vcf.baseName}

	"""
}
