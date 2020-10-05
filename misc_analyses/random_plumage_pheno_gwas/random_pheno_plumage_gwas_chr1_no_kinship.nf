// MAF filter and missing should be BEFORE this script
// bcftools makes it easy

vcf = file("chr1.vcf")

// k = file("chr1_mh_k.txt")
// k = file("chr1_tassel_kinship.txt")
// k = file("global_tassel_kinship.txt")
// k = file("loco_no_chr1.txt")

pheno = file("pheno_plumage.tsv")

n = 500

iteration_ch = Channel.from(0..n-1)

batches = Channel.create()

process Gwas {
	input:
		vcf
		pheno
//		k
		val(iteration) from iteration_ch
	output:
		file("${iteration}*.txt.gz") into output_ch
	memory '8G'
	cpus 4
        errorStrategy 'retry'
        maxRetries 3

	publishDir "GwasOutputNo_${n}", mode: 'copy'

	"""

		gen_random_pheno.pl
		
		/scale_wlg_nobackup/filesets/nobackup/uoo02695/software/tassel-5-standalone/run_pipeline.pl \
			-Xmx6G \
			-fork1 -vcf ${vcf} \
			-fork2 -r pheno_file.txt \
			-combine3 \
			-input1 -input2 -intersect \
			-mlm  \
			-mlmOutputFile ${iteration}
		pigz *txt
	"""
}