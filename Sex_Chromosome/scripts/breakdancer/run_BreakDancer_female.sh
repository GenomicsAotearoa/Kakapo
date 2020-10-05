#!/bin/bash/
#####################################################################################
#Script for running the BreakDancer software package. Intended for structural 
#variant calling. BreakDancer is aprogram for the detection of structural variants 
#from paired-end sequence data.
#####################################################################################
##Setting fixed variables
workbam=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/alignments_female/bam/sorted/
jane=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/alignments_female/jane/jane_sim_sorted.bam
cfg_dir=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/breakdancer/config/
output=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/breakdancer/output/

for samp in ${workbam}*.sorted.bam
	do
	base=$(basename ${samp} .sorted.bam)
	#echo "Generating BreakDancer config for ${base}."
	#bam2cfg.pl -g ${workbam}${base}.sorted.bam ${jane} > ${workbam}${base}.cfg
	#mv ${workbam}*histogram* ${hist_out}
	echo "Running BreakDancer for ${base}."
	breakdancer-max -f -d ${output}${base} ${workbam}${base}.cfg > ${output}${base}.out
	mv ${workbam}${base}.cfg ${cfg_dir}
done
