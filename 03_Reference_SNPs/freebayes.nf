// Should do a proper split but this is quicker
/*Channel
	.fromPath("/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/03_Reference_SNPs/alignments/*.cram")
	.toList()
	.set { reads_all }

reads_all.subscribe { println it }*/
cram_location = "/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/03_Reference_SNPs/alignments/*.cram"

assembly = file("/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/00_Assembly_Procedures/store/downloaded/assembly.fasta")

process calculateRegions {
	tag { "Calculate regions" }
	executor 'local'
	cpus 1
	cache true
	queue 'prepost'
	time '10m'
	memory '1000 MB'
	conda 'bioconda::freebayes'
	
	input:
		assembly

	output:
		stdout regions

	"""
	fasta_generate_regions.py ${assembly} 100000
	"""
	
}

regions
	.collect()
	.splitText()
	.map { [it[0].trim().replaceAll(":", "_"), it[0].trim()] }
	.set { regions_processed }

process FreeBayes {
	tag { "FreeBayes ${region_name}" }
	cpus 1
	cache true
	queue 'large'
	time '48h'
	memory '5000 MB'
	conda 'bioconda::freebayes'
	publishDir './freebayes-regions/'

	input:
		assembly
		// reads_all
		set val(region_name), val(region) from regions_processed

	output:
		file("${region_name}.vcf")

	"""
	freebayes \
		--fasta-reference ${assembly} \
		--haplotype-length 100 \
		--region ${region} \
		-m 5 \
		${cram_location} > ${region_name}.vcf
	"""
	
}
