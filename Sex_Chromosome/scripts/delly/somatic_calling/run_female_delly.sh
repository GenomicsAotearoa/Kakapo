#!/bin/bash/ -e
#####################################################################################
#Script for running the Delly software package. Intended for structural variant 
#calling. Delly is a program for the detection of structural variants from paired-end
#sequence data.
#####################################################################################

##Setting fixed variables
workbam=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/alignments_female/bam/sorted/
ref=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/References/kakapo_full_ref.fna
control=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/alignments_female/jane/jane_sim_sorted.bam
config=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/delly/config/
output=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/delly/output/

for samp in ${workbam}*.sorted.bam
	do
	base=$(basename ${samp} .sorted.bam)
	#echo "Sorting ${base}"
	#time samtools sort $samp > ${workbam}${base}.sorted.bam
	#echo "Creating index for ${base}"
	#time samtools index ${workbam}${base}.sorted.bam
	echo "Running Delly for ${base}"
	time delly call -o ${output}${base}.bcf -g ${ref} ${workbam}${base}.sorted.bam ${control}
	echo "Somatic pre-filtering for ${base}."
	time bcftools view -h ${output}${base}.bcf | grep QUAL | awk -v OFS='\t' '{print $10,"tumor"}' > ${config}${base}.csv
	sed -i -e '$ajane_simulated\tcontrol' ${config}${base}.csv
	time delly filter -f somatic -o ${output}${base}.prefilter.bcf -s ${config}${base}.csv ${output}${base}.bcf
done
