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
--output ${vcfoutput}males_B09.vcf.gz \
--assembly ${bamoutput}males_B09_gridss.bam \
--threads 8 \
--labels Jane_noW,Tutoko,Waihopai,Waynebo,Wharetutu,Whiskas,Wiremu,Wolf \
--workingdir /data/GRIDSS/male \
/data/alignments_female/jane/jane_sim_noW.sorted.bam \
/data/alignments_male/bam/sorted/Tutoko.sorted.bam \
/data/alignments_male/bam/sorted/Waihopai.sorted.bam \
/data/alignments_male/bam/sorted/Waynebo.sorted.bam \
/data/alignments_male/bam/sorted/Wharetutu.sorted.bam \
/data/alignments_male/bam/sorted/Whiskas.sorted.bam \
/data/alignments_male/bam/sorted/Wiremu.sorted.bam \
/data/alignments_male/bam/sorted/Wolf.sorted.bam
