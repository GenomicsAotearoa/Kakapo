#!/bin/sh
#####################################################################################
#Creating a configuration file for Batch 01 of MANTA structural variant calling.
######################################################################################
manta=/scale_wlg_nobackup/filesets/nobackup/uoo02695/software/manta-1.6.0.centos6_x86_64/
input=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/alignments_female/bam/sorted/
jane=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/alignments_female/jane/jane_sim_sorted.bam
output=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/manta/female/batch01/
ref=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/References/kakapo_full_ref.fa

${manta}/bin/configManta.py \
--bam ${jane} \
--bam ${input}Adelaide.sorted.bam \
--bam ${input}Alice.sorted.bam \
--bam ${input}Aparima.sorted.bam \
--bam ${input}Aranga.sorted.bam \
--bam ${input}Atareta.sorted.bam \
--bam ${input}Aumaria.sorted.bam \
--bam ${input}Awarua.sorted.bam \
--bam ${input}Bella.sorted.bam \
--bam ${input}Boomer.sorted.bam \
--bam ${input}Cyndy.sorted.bam \
--bam ${input}Dusky.sorted.bam \
--referenceFasta ${ref} \
--runDir ${output}
