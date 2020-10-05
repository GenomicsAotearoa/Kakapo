#!/bin/sh
#####################################################################################
#Creating a configuration file for Batch 01 of MANTA structural variant calling.
######################################################################################
manta=/scale_wlg_nobackup/filesets/nobackup/uoo02695/software/manta-1.6.0.centos6_x86_64/
input=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/alignments_female/bam/sorted/
jane=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/alignments_female/jane/jane_sim_sorted.bam
output=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/manta/female/batch06/
ref=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/References/kakapo_full_ref.fa

${manta}/bin/configManta.py \
--bam ${jane} \
--bam ${input}Sandra.sorted.bam \
--bam ${input}Sarah.sorted.bam \
--bam ${input}Solstice.sorted.bam \
--bam ${input}Stella.sorted.bam \
--bam ${input}Sue.sorted.bam \
--bam ${input}Suzanne.sorted.bam \
--bam ${input}Tia.sorted.bam \
--bam ${input}Tiaka.sorted.bam \
--bam ${input}Titapu.sorted.bam \
--bam ${input}Tiwhiri.sorted.bam \
--bam ${input}Tohu.sorted.bam \
--referenceFasta ${ref} \
--runDir ${output}
