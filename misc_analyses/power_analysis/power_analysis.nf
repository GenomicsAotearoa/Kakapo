Channel
        .fromFilePairs('power_analysis/*_{testsnp.vcf,tassel_pheno.txt}')
        .set { simulations_ch }

first_half_vcf = file("all_first_half.vcf")
second_half_vcf = file("all_second_half.vcf")
rename = file("rename_chrs.txt")
k = file("global_tassel_kinship.txt")

process PowerAnalysisGWAS {
	input:
		tuple val(id), file(files) from simulations_ch
		first_half_vcf
		second_half_vcf
		rename
	output:
		tuple file("${id}*_stats.txt.gz"), file("*.vals.txt") into output_ch
	memory '32G'
	errorStrategy 'retry'
	maxRetries 16
	cpus 4
	conda 'python==3.8 bioconda::bcftools numpy pandas'

	publishDir "GwasOutput", mode: 'move'

	"""
		cat ${first_half_vcf} ${files[1]} ${second_half_vcf} > test.vcf

		/scale_wlg_nobackup/filesets/nobackup/uoo02695/software/tassel-5-standalone/run_pipeline.pl \
			-Xms31g -Xmx31g \
			-fork1 -vcf test.vcf \
			-fork2 -r ${files[0]} \
			-combine3 \
			-input1 -input2 -intersect \
			-fork4 -k ${k} \
			-combine5 -input3 -input4 \
			-mlm  \
			-mlmOutputFile ${id}

	python /scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/misc_analyses/power_analysis/bin/get_vals.py
	rm *vcf
	pigz *_stats.txt
	"""
}
//                bcftools annotate --rename-chrs ${rename} test.vcf -Ov -o renamed.vcf

