
// Input VCF must be bgzip'd and tabix indexed...

reference = file("/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/NCBI_New_Reference.fasta")
reference_fai = file("/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/NCBI_New_Reference.fasta.fai")
vcf = file("snps_more_filtering.vcf.gz")
ped = file("Pedigree_AP.txt")
ncycles = 1000

process getLandmarks {
	executor 'local'
	output:
		stdout landmarks_ch

	"""
	cat ${reference_fai} | cut -f 1
	"""
}

process getGenoFiles {
	input:
		val(landmark) from landmarks_ch.splitText() { it.trim() }
		vcf
	tag "${landmark}"
	cpus 1
	time '2h'
	memory '2 GB'
//	storeDir "genoFiles"
	executor 'local'

	output:
		tuple val(landmark), file("${landmark}_control"), file("geno_${landmark}.txt") into genos_ch

	shell:
	'''
	#!/usr/bin/env fish
	VCF_to_AlphaPeel_Genotype.py !{vcf} !{landmark} > geno_!{landmark}.txt
	set nsnps (head -n 1 geno_!{landmark}.txt | wc -w)
	set nsnps (math $nsnps-1)
	echo "nSnp, $nsnps" > !{landmark}_control
	echo "InputFilePath, geno_!{landmark}.txt" >> !{landmark}_control
	echo "pedigree, !{ped}" >> !{landmark}_control
	echo "OutputFilePath, !{landmark}_output_ncycles!{ncycles}" >> !{landmark}_control
	echo "nCycles, !{ncycles}" >> !{landmark}_control
	echo "runType, multi" >> !{landmark}_control

	'''
}

process AlphaPeel {
	input:
		tuple val(landmark), file(ctrl), file(genos) from genos_ch
	output:
		file("*_output_ncycles*")

	executor 'slurm'
	publishDir "AlphaPeel_n1000cycles_out_morefilter"
	errorStrategy 'retry'
	maxRetries 5

	tag "${landmark}"

	time 72.hour
	memory '105 GB'
	cpus 72
	queue 'large'

	"""
	AlphaPeel ${ctrl}
	"""

}
