#!/bin/sh
#####################################################################################
#Creating a configuration file for Batch 01 of MANTA structural variant calling.
######################################################################################
manta=/scale_wlg_nobackup/filesets/nobackup/uoo02695/software/manta-1.6.0.centos6_x86_64/
input=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/alignments_female/bam/sorted/
jane=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/alignments_female/jane/jane_sim_sorted.bam
output=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/manta/female/batch07/
ref=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/References/kakapo_full_ref.fa

${manta}/bin/configManta.py \
--bam ${jane} \
--bam ${input}Toitiiti.sorted.bam \
--bam ${input}Tukaha.sorted.bam \
--bam ${input}Tumeke.sorted.bam \
--bam ${input}Waa.sorted.bam \
--bam ${input}Waikawa.sorted.bam \
--bam ${input}Weheruatanga-o-te-po.sorted.bam \
--bam ${input}Wendy.sorted.bam \
--bam ${input}Yasmine.sorted.bam \
--bam ${input}Zephyr.sorted.bam \
--referenceFasta ${ref} \
--runDir ${output}
