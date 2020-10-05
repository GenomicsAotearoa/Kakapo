#!/bin/sh
#####################################################################################
#Creating a configuration file for Batch 01 of MANTA structural variant calling.
######################################################################################
manta=/scale_wlg_nobackup/filesets/nobackup/uoo02695/software/manta-1.6.0.centos6_x86_64/
input=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/alignments_male/bam/sorted/
jane=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/alignments_female/jane/jane_sim_noW.sorted.bam
output=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/manta/male/batch02/
ref=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/References/kakapo_no_Wchromosome.fa

${manta}/bin/configManta.py \
--bam ${jane} \
--bam ${input}Blake.sorted.bam \
--bam ${input}Bluster_Murphy.sorted.bam \
--bam ${input}Bonus.sorted.bam \
--bam ${input}Boss.sorted.bam \
--bam ${input}Clout.sorted.bam \
--bam ${input}Dobbie.sorted.bam \
--bam ${input}Doc.sorted.bam \
--bam ${input}Egilsay.sorted.bam \
--bam ${input}Elliot.sorted.bam \
--bam ${input}Elwin.sorted.bam \
--bam ${input}Faulkner.sorted.bam \
--referenceFasta ${ref} \
--runDir ${output}
