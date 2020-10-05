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
labels=$(ls -lh ${container}alignments_male/bam/sorted/ | awk '{print $9}' | grep -v .bai | sort | head -n 22 | tail -n 11 | xargs | sed -e "s/.sorted.bam /,/g" | sed -e "s/.sorted.bam//g")

echo "Running GRIDSS for males"

singularity run \
-B ${container}:/data \
gridss_latest.sif \
--reference ${ref} \
--output ${vcfoutput}males_B02.vcf.gz \
--assembly ${bamoutput}males_B02_gridss.bam \
--threads 8 \
--labels Jane_noW,${labels} \
--workingdir /data/GRIDSS/male \
/data/alignments_female/jane/jane_sim_noW.sorted.bam \
/data/alignments_male/bam/sorted/Blake.sorted.bam \
/data/alignments_male/bam/sorted/Bluster_Murphy.sorted.bam \
/data/alignments_male/bam/sorted/Bonus.sorted.bam \
/data/alignments_male/bam/sorted/Boss.sorted.bam \
/data/alignments_male/bam/sorted/Clout.sorted.bam \
/data/alignments_male/bam/sorted/Dobbie.sorted.bam \
/data/alignments_male/bam/sorted/Doc.sorted.bam \
/data/alignments_male/bam/sorted/Egilsay.sorted.bam \
/data/alignments_male/bam/sorted/Elliot.sorted.bam \
/data/alignments_male/bam/sorted/Elwin.sorted.bam \
/data/alignments_male/bam/sorted/Faulkner.sorted.bam \
