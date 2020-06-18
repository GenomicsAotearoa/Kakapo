// Nesi Queues Reference
// https://support.nesi.org.nz/hc/en-gb/articles/360000204076-Mahuika-Slurm-Partitions

Channel
//  .fromFilePairs("/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/03_Reference_SNPs/alignments-dvtest/*.{cram,cram.crai}", flat: true)
//  .fromFilePairs("/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/03_Reference_SNPs/alignments/*.{cram,cram.crai}", flat: true)
    .fromPath("/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/03_Reference_SNPs/alignments/*.cram")
    .set { alignments }

reference = file("/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/04_GATK_Comparison/NCBI_New_Reference.fasta")

process HaplotypeCaller {
	tag { "${alignment.baseName}" }
	storeDir "./store"
	publishDir "./calls"
	cpus 4
	memory '48GB'
	queue 'large'
	cache true
	time '48h'
	module 'GATK/4.1.4.1-gimkl-2018b'
	
	input:
		file(alignment) from alignments

	output:
		file("${alignment.baseName}.vcf.gz")

	"""
	gatk --java-options "-Xmx38g" HaplotypeCaller \
		-R ${reference} \
		-I ${alignment} \
		-O ${alignment.baseName}.vcf.gz \
		-ERC GVCF
			
	"""
		
}
