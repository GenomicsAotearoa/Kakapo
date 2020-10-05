#!/bin/sh
#####################################################################################
#Creating a configuration file for Batch 01 of MANTA structural variant calling.
######################################################################################
manta=/scale_wlg_nobackup/filesets/nobackup/uoo02695/software/manta-1.6.0.centos6_x86_64/
input=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/alignments_male/bam/sorted/
jane=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/alignments_female/jane/jane_sim_noW.sorted.bam
output=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/manta/male/batch06/
ref=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/References/kakapo_no_Wchromosome.fa

${manta}/bin/configManta.py \
--bam ${jane} \
--bam ${input}Morehu.sorted.bam \
--bam ${input}Moss.sorted.bam \
--bam ${input}Ngatapa.sorted.bam \
--bam ${input}Nog.sorted.bam \
--bam ${input}Oraka.sorted.bam \
--bam ${input}Ox.sorted.bam \
--bam ${input}Paddy.sorted.bam \
--bam ${input}Palmersan.sorted.bam \
--bam ${input}Percy.sorted.bam \
--bam ${input}Piripi.sorted.bam \
--bam ${input}Ralph.sorted.bam \
--referenceFasta ${ref} \
--runDir ${output}
