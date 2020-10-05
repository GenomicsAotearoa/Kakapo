// MAF filter and missing should be BEFORE this script
// bcftools makes it easy

bcf = file("/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/misc_analyses/gwas_set_numeric_maf_0.05_f_missing_0.2.bcf")
bcfidx = file("/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/misc_analyses/gwas_set_numeric_maf_0.05_f_missing_0.2.bcf.csi")

k = file("mh_k.tsv.txt")

pheno = file("gcta_plumage.txt")
// bcf = file("../1.bcf")
// bcfidx = file("../1.bcf.csi")

n_snps = 25000

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
	cpus 12

	publishDir "GwasOutputGcta_${n_snps}", mode: 'copy'

	"""
		bcftools view ${bcf} -r $chr:${snps[0]}-${snps[-1]} -Ov -o region.vcf

		bcftools +prune -l 0.8 -w 1000 -e'F_MISSING>=0.05' region.vcf -Ov -o region_pruned.vcf
		plink2 --vcf region.vcf --make-bed --out region

		gcta64 --mlma --bfile region --grm ${k} --pheno ${pheno} --out test --thread-num 10

			
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
