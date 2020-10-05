// MAF filter and missing should be BEFORE this script
// bcftools makes it easy

vcf = file("/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/misc_analyses/random_plumage_pheno_gwas/gwas_set_numeric_maf_0.05_f_missing_0.2.vcf")

k = file("mh_k.tsv.txt")

pheno = file("pheno_plumage.tsv")

n = 2000

iteration_ch = Channel.from(0..n-1)

batches = Channel.create()

process Gwas {
	input:
		vcf
		pheno
		k
		val(iteration) from iteration_ch
	output:
		file("${iteration}*.txt.gz") into output_ch
	memory '30G'
	cpus 4

	publishDir "GwasOutput_${n}", mode: 'copy'

	"""

		gen_random_pheno.pl
		
		/scale_wlg_nobackup/filesets/nobackup/uoo02695/software/tassel-5-standalone/run_pipeline.pl \
			-Xmx26G \
			-fork1 -vcf ${vcf} \
			-fork2 -r pheno_file.txt \
			-combine3 \
			-input1 -input2 -intersect \
			-fork4 -k ${k} \
			-combine5 -input3 -input4 \
			-mlm  \
			-mlmOutputFile ${iteration}
		pigz *txt
	"""
}
