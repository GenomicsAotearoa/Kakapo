#!/bin/sh
#####################################################################################
#Creating a configuration file for Batch 01 of MANTA structural variant calling.
######################################################################################
manta=/scale_wlg_nobackup/filesets/nobackup/uoo02695/software/manta-1.6.0.centos6_x86_64/
input=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/alignments_female/bam/sorted/
jane=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/alignments_female/jane/jane_sim_sorted.bam
output=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/manta/female/batch04/
ref=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/References/kakapo_full_ref.fa

${manta}/bin/configManta.py \
--bam ${jane} \
--bam ${input}Kura.sorted.bam \
--bam ${input}Lisa.sorted.bam \
--bam ${input}Maggie.sorted.bam \
--bam ${input}Mahli.sorted.bam \
--bam ${input}Makorea.sorted.bam \
--bam ${input}Marama.sorted.bam \
--bam ${input}Margaret-Maree.sorted.bam \
--bam ${input}Marian.sorted.bam \
--bam ${input}Mila.sorted.bam \
--bam ${input}Millie.sorted.bam \
--bam ${input}Mukeke.sorted.bam \
--referenceFasta ${ref} \
--runDir ${output}
