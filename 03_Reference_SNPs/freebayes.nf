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
	// Runs fast so execute locally
	executor 'local'
	cpus 1
	cache false
	time '10m'
	memory '1000 MB'
	conda 'bioconda::freebayes'
	
	input:
		assembly

	output:
		stdout regions

	"""
	fasta_generate_regions.py ${assembly} 500000
	"""
	
}

regions
	.collect()
	.splitText()
	.map { [it[0].trim().replaceAll(":", "_"), it[0].trim()] }
	.set { regions_processed }

process FreeBayes {
	tag { "FreeBayes ${region_name}" }
	cpus 2
	errorStrategy 'ignore'
//	errorStrategy 'finish'
	cache true
//	queue 'ga_hugemem'
	queue 'large'
	time '3d'
	memory '6 GB'
//	memory '26 GB'
//	memory '65 GB'
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
		--haplotype-length 120 \
		--region ${region} \
		${cram_location} > ${region_name}.vcf
	"""
	
}
