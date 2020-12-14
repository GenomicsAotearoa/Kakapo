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
#labels=$(ls -lh ${container}alignments_male/bam/sorted/ | awk '{print $9}' | grep -v .bai | sort | head -n 55 | tail -n 11 | xargs | sed -e "s/.sorted.bam /,/g" | sed -e "s/.sorted.bam//g")

echo "Running GRIDSS for males"

singularity run \
-B ${container}:/data \
gridss_latest.sif \
--reference ${ref} \
--output ${vcfoutput}males_B05.vcf.gz \
--assembly ${bamoutput}males_B05_gridss.bam \
--threads 8 \
--labels Jane_noW,Konini_3-4-16,Kotiu,Kumi,Lee,Lionel,Luke,Manu,Matangi,Merty,Merv,Moorhouse \
--workingdir /data/GRIDSS/male \
/data/alignments_female/jane/jane_sim_noW.sorted.bam \
/data/alignments_male/bam/sorted/Konini_3-4-16.sorted.bam \
/data/alignments_male/bam/sorted/Kotiu.sorted.bam \
/data/alignments_male/bam/sorted/Kumi.sorted.bam \
/data/alignments_male/bam/sorted/Lee.sorted.bam \
/data/alignments_male/bam/sorted/Lionel.sorted.bam \
/data/alignments_male/bam/sorted/Luke.sorted.bam \
/data/alignments_male/bam/sorted/Manu.sorted.bam \
/data/alignments_male/bam/sorted/Matangi.sorted.bam \
/data/alignments_male/bam/sorted/Merty.sorted.bam \
/data/alignments_male/bam/sorted/Merv.sorted.bam \
/data/alignments_male/bam/sorted/Moorhouse.sorted.bam
