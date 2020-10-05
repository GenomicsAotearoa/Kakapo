
// input BCF requires an  index

reference = file("/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/NCBI_New_Reference.fasta")
reference_fai = file("/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/NCBI_New_Reference.fasta.fai")
bcf = file("/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/misc_analyses/whatshap/snps_maf_0.05_to_0.95_f_missing_0.2.bcf")
ped = file("highconfidence.ped")

process getLandmarks {
	executor 'local'
	output:
		stdout landmarks_ch

	"""
	cat ${reference_fai} | cut -f 1
	"""
}

process filterBcfFile {
	conda '/nesi/project/uoo02695/anaconda3/envs/bcftools/'

	input:
		val(landmark) from landmarks_ch.splitText() { it.trim() }
		bcf
	tag "${landmark}"
	cpus 1
	time '2h'
	memory '2 GB'
	storeDir "filteredBcfFiles"
	executor 'slurm'

	output:
		tuple val(landmark), file("${landmark}.vcf") into vcfs_ch

	"""
	bcftools view -r ${landmark} ${bcf} > ${landmark}.vcf
	"""
}

process whatshap {
	input:
		tuple val(landmark), file(vcf) from vcfs_ch
		reference
		reference_fai
		ped
	output:
		file("${landmark}.phased.vcf")

	executor 'slurm'

	tag "${landmark}"

	publishDir "phased"
	storeDir "phased_store"
	conda '/nesi/project/uoo02695/anaconda3/envs/whatshap-dev/'
	time '168h'
	memory '240 GB'
	cpus 4
	queue 'bigmem'

// --ped ${ped}


	"""
	whatshap phase -o ${landmark}.phased.vcf \
	--indels \
	--reference=${reference} \
	${vcf} \
	/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/03_Reference_SNPs/alignments/*cram
	"""

}
