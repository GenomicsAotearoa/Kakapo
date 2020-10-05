#!/bin/sh
#####################################################################################
#Creating a configuration file for Batch 01 of MANTA structural variant calling.
######################################################################################
manta=/scale_wlg_nobackup/filesets/nobackup/uoo02695/software/manta-1.6.0.centos6_x86_64/
input=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/alignments_male/bam/sorted/
jane=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/alignments_female/jane/jane_sim_noW.sorted.bam
output=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/manta/male/batch07/
ref=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/References/kakapo_no_Wchromosome.fa

${manta}/bin/configManta.py \
--bam ${jane} \
--bam ${input}Rangi.sorted.bam \
--bam ${input}Richard_Henry.sorted.bam \
--bam ${input}Robbie.sorted.bam \
--bam ${input}Ruapuke.sorted.bam \
--bam ${input}Ruggedy.sorted.bam \
--bam ${input}Sass.sorted.bam \
--bam ${input}Scratch.sorted.bam \
--bam ${input}Sinbad.sorted.bam \
--bam ${input}Sirocco.sorted.bam \
--bam ${input}Smoko.sorted.bam \
--bam ${input}Stumpy.sorted.bam \
--referenceFasta ${ref} \
--runDir ${output}
