#!/bin/sh
#####################################################################################
#Creating a configuration file for Batch 01 of MANTA structural variant calling.
######################################################################################
manta=/scale_wlg_nobackup/filesets/nobackup/uoo02695/software/manta-1.6.0.centos6_x86_64/
input=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/alignments_female/bam/sorted/
jane=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/alignments_female/jane/jane_sim_sorted.bam
output=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/manta/female/batch05/
ref=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/References/kakapo_full_ref.fa

${manta}/bin/configManta.py \
--bam ${jane} \
--bam ${input}Ninihi.sorted.bam \
--bam ${input}Nora.sorted.bam \
--bam ${input}Pearl.sorted.bam \
--bam ${input}Pounamu.sorted.bam \
--bam ${input}Pura.sorted.bam \
--bam ${input}Queenie.sorted.bam \
--bam ${input}Ra.sorted.bam \
--bam ${input}Rakiura.sorted.bam \
--bam ${input}Rimu.sorted.bam \
--bam ${input}Roha.sorted.bam \
--bam ${input}Ruth.sorted.bam \
--referenceFasta ${ref} \
--runDir ${output}
