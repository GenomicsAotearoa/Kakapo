// MAF filter and missing should be BEFORE this script
// bcftools makes it easy

bcf = file("/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/misc_analyses/gwas_set_numeric_maf_0.05_f_missing_0.2.bcf")
bcfidx = file("/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/misc_analyses/gwas_set_numeric_maf_0.05_f_missing_0.2.bcf.csi")

k = file("mh_k.tsv.txt")

pheno = file("pheno_plumage.tsv")
// bcf = file("../1.bcf")
// bcfidx = file("../1.bcf.csi")

n_snps = 5000

process GetAllSnps {
	executor 'local'
	input:
		bcf
		bcfidx

	output:
		stdout into all_snps

	"""
	bcftools query -f '%CHROM\t%POS\n' ${bcf}
	"""

}

batches = Channel.create()

all_snps
        .splitCsv(header: false, sep: '\t')
        .groupTuple()
        .map { chr, snps -> Channel.from(snps)
				.map { it.toInteger() }
				.collate(n_snps) 
				.map { subset -> batches << [ chr.toInteger(), subset.toList() ] }
		}
	.subscribe onComplete: { sleep(5000); batches.close() }

// all_snps.subscribe onComplete: { batches.close() }

//	.count()
//	.println()
//	.set { by_chr_by_batch }

// batches.view().count().view()
// batches.subscribe { it[1].println() }


// TODO: Heap size
process LocalPopStructGwas {
	input:
		bcf
		pheno
		tuple val(chr), val(snps) from batches
		k
	output:
		file("${chr}_${snps[0]}_${snps[-1]}*.txt") into output_ch
	memory '32G'
	cpus 4

	publishDir "GwasOutput_${n_snps}", mode: 'copy'

	"""
		bcftools view ${bcf} -r $chr:${snps[0]}-${snps[-1]} -Ov -o region.vcf

		bcftools +prune -l 0.8 -w 1000 -e'F_MISSING>=0.05' region.vcf -Ov -o region_pruned.vcf

		# Note: Not using this anymore, actually...
		/scale_wlg_nobackup/filesets/nobackup/uoo02695/software/tassel-5-standalone/run_pipeline.pl \
			-Xms16g -Xmx30g \
			-vcf region_pruned.vcf \
			-KinshipPlugin \
			-endPlugin \
			-export region_kinship.txt \
			-exportType SqrMatrix

		/scale_wlg_nobackup/filesets/nobackup/uoo02695/software/tassel-5-standalone/run_pipeline.pl \
			-fork1 -vcf region.vcf \
			-fork2 -r ${pheno} \
			-combine3 \
			-input1 -input2 -intersect \
			-fork4 -k ${k} \
			-combine5 -input3 -input4 \
			-mlm  \
			-mlmOutputFile ${chr}_${snps[0]}_${snps[-1]} \
			-mlmVarCompEst EachMarker \
			-mlmCompressionLevel None

		mv region_kinship.txt ${chr}_${snps[0]}_${snps[-1]}_kinship.txt 
			
			
	"""
}

process plotOutput {
	memory '4G'
	cpus 1
	time '30m'

	input:
		file(files) from output_ch.collect()
	output:
		file("*.pdf")
		file("*.jpeg")
		file("*.svg")

        publishDir "GwasOutput_plots_${n_snps}", mode: 'copy'

	conda 'psutil plotly plotly::plotly-orca requests numpy pandas'

	"""
	plot.py .
	"""
}
