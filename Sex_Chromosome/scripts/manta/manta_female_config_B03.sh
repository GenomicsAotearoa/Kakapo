#!/bin/sh
#####################################################################################
#Creating a configuration file for Batch 01 of MANTA structural variant calling.
######################################################################################
manta=/scale_wlg_nobackup/filesets/nobackup/uoo02695/software/manta-1.6.0.centos6_x86_64/
input=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/alignments_female/bam/sorted/
jane=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/alignments_female/jane/jane_sim_sorted.bam
output=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/manta/female/batch03/
ref=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/References/kakapo_full_ref.fa

${manta}/bin/configManta.py \
--bam ${jane} \
--bam ${input}Hinemoa.sorted.bam \
--bam ${input}Hine_Taumai.sorted.bam \
--bam ${input}Hoki.sorted.bam \
--bam ${input}Huhana.sorted.bam \
--bam ${input}Ihi.sorted.bam \
--bam ${input}Jean.sorted.bam \
--bam ${input}Jemma.sorted.bam \
--bam ${input}JEM.sorted.bam \
--bam ${input}Konini.sorted.bam \
--bam ${input}Kuia.sorted.bam \
--bam ${input}Kuihi.sorted.bam \
--referenceFasta ${ref} \
--runDir ${output}
