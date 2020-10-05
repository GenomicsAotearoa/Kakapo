#!/bin/sh
#####################################################################################
#Creating a configuration file for Batch 01 of MANTA structural variant calling.
######################################################################################
manta=/scale_wlg_nobackup/filesets/nobackup/uoo02695/software/manta-1.6.0.centos6_x86_64/
input=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/alignments_male/bam/sorted/
jane=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/alignments_female/jane/jane_sim_noW.sorted.bam
output=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/manta/male/batch04/
ref=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/References/kakapo_no_Wchromosome.fa

${manta}/bin/configManta.py \
--bam ${jane} \
--bam ${input}Hurihuri.sorted.bam \
--bam ${input}Ian.sorted.bam \
--bam ${input}Jack.sorted.bam \
--bam ${input}Jamieson.sorted.bam \
--bam ${input}Jester.sorted.bam \
--bam ${input}Jimmy.sorted.bam \
--bam ${input}Joe.sorted.bam \
--bam ${input}Juanma.sorted.bam \
--bam ${input}Kanawera.sorted.bam \
--bam ${input}Kokoto.sorted.bam \
--bam ${input}Komaru.sorted.bam \
--referenceFasta ${ref} \
--runDir ${output}
