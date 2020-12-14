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
#labels=$(ls -lh ${container}alignments_male/bam/sorted/ | awk '{print $9}' | grep -v .bai | sort | head -n 66 | tail -n 11 | xargs | sed -e "s/.sorted.bam /,/g" | sed -e "s/.sorted.bam//g")

echo "Running GRIDSS for males"

singularity run \
-B ${container}:/data \
gridss_latest.sif \
--reference ${ref} \
--output ${vcfoutput}males_B07.vcf.gz \
--assembly ${bamoutput}males_B07_gridss.bam \
--threads 8 \
--labels Jane_noW,Rangi,Richard_Henry,Robbie,Ruapuke,Ruggedy,Sass,Scratch,Sinbad,Sirocco,Smoko,Stumpy \
--workingdir /data/GRIDSS/male \
/data/alignments_female/jane/jane_sim_noW.sorted.bam \
/data/alignments_male/bam/sorted/Rangi.sorted.bam \
/data/alignments_male/bam/sorted/Richard_Henry.sorted.bam \
/data/alignments_male/bam/sorted/Robbie.sorted.bam \
/data/alignments_male/bam/sorted/Ruapuke.sorted.bam \
/data/alignments_male/bam/sorted/Ruggedy.sorted.bam \
/data/alignments_male/bam/sorted/Sass.sorted.bam \
/data/alignments_male/bam/sorted/Scratch.sorted.bam \
/data/alignments_male/bam/sorted/Sinbad.sorted.bam \
/data/alignments_male/bam/sorted/Sirocco.sorted.bam \
/data/alignments_male/bam/sorted/Smoko.sorted.bam \
/data/alignments_male/bam/sorted/Stumpy.sorted.bam
