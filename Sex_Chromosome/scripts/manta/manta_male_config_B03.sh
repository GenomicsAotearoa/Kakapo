#!/bin/sh
#####################################################################################
#Creating a configuration file for Batch 01 of MANTA structural variant calling.
######################################################################################
manta=/scale_wlg_nobackup/filesets/nobackup/uoo02695/software/manta-1.6.0.centos6_x86_64/
input=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/alignments_male/bam/sorted/
jane=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/alignments_female/jane/jane_sim_noW.sorted.bam
output=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/manta/male/batch03/
ref=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/References/kakapo_no_Wchromosome.fa

${manta}/bin/configManta.py \
--bam ${jane} \
--bam ${input}Felix.sorted.bam \
--bam ${input}George.sorted.bam \
--bam ${input}Guapo.sorted.bam \
--bam ${input}Gulliver.sorted.bam \
--bam ${input}Gumboots.sorted.bam \
--bam ${input}Gunner.sorted.bam \
--bam ${input}Henry.sorted.bam \
--bam ${input}Hillary.sorted.bam \
--bam ${input}Hokonui.sorted.bam \
--bam ${input}Horton.sorted.bam \
--bam ${input}Hugh.sorted.bam \
--referenceFasta ${ref} \
--runDir ${output}
