#!/bin/sh
#####################################################################################
#Creating a configuration file for Batch 01 of MANTA structural variant calling.
######################################################################################
manta=/scale_wlg_nobackup/filesets/nobackup/uoo02695/software/manta-1.6.0.centos6_x86_64/
input=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/alignments_female/bam/sorted/
jane=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/alignments_female/jane/jane_sim_sorted.bam
output=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/manta/female/batch02/
ref=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/References/kakapo_full_ref.fa

${manta}/bin/configManta.py \
--bam ${jane} \
--bam ${input}Ellie.sorted.bam \
--bam ${input}Esperance.sorted.bam \
--bam ${input}Evohe.sorted.bam \
--bam ${input}Flossie.sorted.bam \
--bam ${input}Fuchsia.sorted.bam \
--bam ${input}Gertrude.sorted.bam \
--bam ${input}Hakatere.sorted.bam \
--bam ${input}Hananui.sorted.bam \
--bam ${input}Hauturu.sorted.bam \
--bam ${input}Heather.sorted.bam \
--bam ${input}Hera.sorted.bam \
--referenceFasta ${ref} \
--runDir ${output}
