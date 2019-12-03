Channel.fromPath("mendelian_inheritance_snps/*vcf")
	.set { unsorted }

process sortVcf {
	input:
		file(vcf) from unsorted
	output:
		file("sorted/${vcf.baseName}.vcf") into sorted
	storeDir './misnps_sorted/'
	conda 'bioconda::bcftools'
    queue 'prepost'
    time '3h'
    cpus '2'
    memory '3g'
	tag { "${vcf.baseName}" }

	"""
		mkdir sorted
		bcftools sort ${vcf} > sorted/${vcf.baseName}.vcf
	"""
}


process mergeVcfs {
	input:
		file(vcf) from sorted
	output:
		file("merged/${vcf.baseName}.vcf.gz")
	storeDir 'merged_vcfs'
	publishDir 'merged_training_vcfs', mode: 'copy'
	conda 'bioconda::bcftools'
        tag { "${vcf.baseName}" }
    queue 'prepost'
    time '3h'
    cpus '2'
    memory '3g'

	"""
	mkdir merged
	bgzip -f /scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/03_Reference_SNPs/DeepVariantTraining/training_data/confident/${vcf.baseName}.vcf || true
	bgzip -fr /scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/03_Reference_SNPs/DeepVariantTraining/training_data/confident/${vcf.baseName}.vcf.gz
	tabix -f /scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/03_Reference_SNPs/DeepVariantTraining/training_data/confident/${vcf.baseName}.vcf.gz
	bgzip -f ${vcf} || true
	bgzip -fr ${vcf}.gz
	tabix -f ${vcf}.gz
	bcftools concat -a -D /scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/03_Reference_SNPs/DeepVariantTraining/training_data/confident/${vcf.baseName}.vcf.gz ${vcf}.gz > remove_dupes.vcf
	bgzip -f remove_dupes.vcf
	bgzip -fr remove_dupes.vcf.gz
	tabix -f remove_dupes.vcf.gz
	bcftools concat -a -D remove_dupes.vcf.gz ${vcf}.gz > merged/${vcf.baseName}.vcf
	bgzip merged/${vcf.baseName}.vcf
	"""
}

