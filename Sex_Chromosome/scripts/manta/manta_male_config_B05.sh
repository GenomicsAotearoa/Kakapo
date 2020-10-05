#!/bin/sh
#####################################################################################
#Creating a configuration file for Batch 01 of MANTA structural variant calling.
######################################################################################
manta=/scale_wlg_nobackup/filesets/nobackup/uoo02695/software/manta-1.6.0.centos6_x86_64/
input=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/alignments_male/bam/sorted/
jane=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/alignments_female/jane/jane_sim_noW.sorted.bam
output=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/manta/male/batch05/
ref=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/References/kakapo_no_Wchromosome.fa

${manta}/bin/configManta.py \
--bam ${jane} \
--bam ${input}Konini_3-4-16.sorted.bam \
--bam ${input}Kotiu.sorted.bam \
--bam ${input}Kumi.sorted.bam \
--bam ${input}Lee.sorted.bam \
--bam ${input}Lionel.sorted.bam \
--bam ${input}Luke.sorted.bam \
--bam ${input}Manu.sorted.bam \
--bam ${input}Matangi.sorted.bam \
--bam ${input}Merty.sorted.bam \
--bam ${input}Merv.sorted.bam \
--bam ${input}Moorhouse.sorted.bam \
--referenceFasta ${ref} \
--runDir ${output}
