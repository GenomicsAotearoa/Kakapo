// Should do a proper split but this is quicker
/*Channel
	.fromPath("/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/03_Reference_SNPs/alignments/*.cram")
	.toList()
	.set { reads_all }

reads_all.subscribe { println it }*/
cram_location = "/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/03_Reference_SNPs/alignments/*.cram"

assembly = file("/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/00_Assembly_Procedures/store/downloaded/assembly.fasta")


Channel
     .fromPath('missing_regions3.txt')
     .splitText(by: 1)
     .map { [it.trim().replaceAll(":", "_"), it.trim()] }
     .set { regions_processed }

process FreeBayes {
	tag { "FreeBayes ${region_name}" }
	cpus 6
	errorStrategy 'retry'
	cache 'lenient'
	queue 'bigmem,ga_bigmem'
	time { 24.hour + (4.hour * task.attempt)  }
	memory { 60.GB + ( 20.GB * task.attempt) }
	conda 'bioconda::freebayes'
	storeDir './freebayes-regions.m2/'

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
