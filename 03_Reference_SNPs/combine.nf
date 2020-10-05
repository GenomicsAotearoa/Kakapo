
// Should do a proper split but this is quicker
Channel
	.fromFilePairs("/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/02_Alignments_to_Reference/results/alignments/*_00{1,2,3,4,5,6,7,8,9}.cram", size: -1)
	.set { reads_all }

// assembly = file("$baseDir/../00_Assembly_Procedures/store/downloaded/assembly.fasta")
assembly = file("/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/02_Alignments_to_Reference/updated_reference.fasta")

process combineReads {
	tag { "${read_id}" }
	cpus 6
	cache true
	queue 'prepost'
	time '3h'
	memory '6000 MB'
	conda 'bioconda::samtools'
	publishDir './alignments/', mode: 'move'

	input:
		assembly
		set read_id, file(reads) from reads_all

	output:
		set file("${read_id}.cram"), file("${read_id}.cram.crai")

	"""
	samtools merge \
		--reference ${assembly} \
		-O cram \
		--threads 6 \
		"${read_id}.cram" \
		*.cram
	samtools index "${read_id}".cram
	"""
	
}
