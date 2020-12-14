#!/bin/bash/ -e
#####################################################################################
#Script for running the GRIDSS software package in a Singularity container. GRIDSS is
#a program for the detection of structural variants from paired-end sequence data.
#####################################################################################

##Setting fixed variables
container=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/
ref=/data/References/kakapo_no_Wchromosome.fa
vcfoutput=/data/GRIDSS/vcf_male/
bamoutput=/data/GRIDSS/bams_male/
#bams=$(ls -lh ${container}alignments_male/bam/sorted/ | awk '{print $9}' | grep -v .bai | grep bam | sort | sed -e 's%^%/data/alignments_male/bam/sorted/%' | xargs)
#labels=$(ls -lh ${container}alignments_male/bam/sorted/ | awk '{print $9}' | grep -v .bai | sort | head -n 88 | tail -n 11 | xargs | sed -e "s/.sorted.bam /,/g" | sed -e "s/.sorted.bam//g")

echo "Running GRIDSS for males"

singularity run \
-B ${container}:/data \
gridss_latest.sif \
--reference ${ref} \
--output ${vcfoutput}males_B08.vcf.gz \
--assembly ${bamoutput}males_B08_gridss.bam \
--threads 8 \
--labels Jane_noW,Taeatanga,Takitimu,Tamahou,Tau_Kuhurangi,Te_Atapo,Te_Awa,Te_Here,Te_Kingi,Tiwai,Trevor,Tuterangi \
--workingdir /data/GRIDSS/male \
/data/alignments_female/jane/jane_sim_noW.sorted.bam \
/data/alignments_male/bam/sorted/Taeatanga.sorted.bam \
/data/alignments_male/bam/sorted/Takitimu.sorted.bam \
/data/alignments_male/bam/sorted/Tamahou.sorted.bam \
/data/alignments_male/bam/sorted/Tau_Kuhurangi.sorted.bam \
/data/alignments_male/bam/sorted/Te_Atapo.sorted.bam \
/data/alignments_male/bam/sorted/Te_Awa.sorted.bam \
/data/alignments_male/bam/sorted/Te_Here.sorted.bam \
/data/alignments_male/bam/sorted/Te_Kingi.sorted.bam \
/data/alignments_male/bam/sorted/Tiwai.sorted.bam \
/data/alignments_male/bam/sorted/Trevor.sorted.bam \
/data/alignments_male/bam/sorted/Tuterangi.sorted.bam
