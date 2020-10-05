#!/bin/sh
#####################################################################################
#Creating a configuration file for Batch 01 of MANTA structural variant calling.
######################################################################################
manta=/scale_wlg_nobackup/filesets/nobackup/uoo02695/software/manta-1.6.0.centos6_x86_64/
input=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/alignments_male/bam/sorted/
jane=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/alignments_female/jane/jane_sim_noW.sorted.bam
output=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/manta/male/batch08/
ref=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/References/kakapo_no_Wchromosome.fa

${manta}/bin/configManta.py \
--bam ${jane} \
--bam ${input}Taeatanga.sorted.bam \
--bam ${input}Takitimu.sorted.bam \
--bam ${input}Tamahou.sorted.bam \
--bam ${input}Tau_Kuhurangi.sorted.bam \
--bam ${input}Te_Atapo.sorted.bam \
--bam ${input}Te_Awa.sorted.bam \
--bam ${input}Te_Here.sorted.bam \
--bam ${input}Te_Kingi.sorted.bam \
--bam ${input}Tiwai.sorted.bam \
--bam ${input}Trevor.sorted.bam \
--bam ${input}Tuterangi.sorted.bam \
--referenceFasta ${ref} \
--runDir ${output}

echo "Converting relevant breakend calls to inversion calls..."
${manta}libexec/convertInversion.py \
${manta}libexec/samtools \
${ref} ${output}results/variants/diploidSV.vcf.gz > ${output}batch08_manta_INV_conversion_male.vcf
