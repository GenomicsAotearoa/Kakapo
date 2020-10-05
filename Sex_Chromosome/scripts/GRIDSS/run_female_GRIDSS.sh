#!/bin/bash/ -e
#####################################################################################
#Script for running the Delly software package. Intended for structural variant
#calling. Delly is a program for the detection of structural variants from paired-end
#sequence data.
#####################################################################################

##Setting fixed variables
container=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/
input=/data/alignments_female/bam/sorted/
ref=/data/References/kakapo_full_ref.fa
vcfoutput=/data/GRIDSS/vcf_female/
bamoutput=/data/GRIDSS/bams_female/
#$bams=$(ls -lh ${container}alignments_female/bam/sorted/ | awk '{print $9}' | grep -v .bai | grep bam | sort | sed -e 's%^%/data/alignments_female/bam/sorted/%' | xargs)
$labels=$(ls -lh ${container}alignments_female/bam/sorted/ | awk '{print $9}' | grep -v .bai | sort | xargs | sed -e "s/.sorted.bam /,/g" | sed -e "s/.sorted.bam//g")

echo "Running GRIDSS for females"

singularity run \
-B ${container}:/data \
gridss_latest.sif \
--reference ${ref} \
--output ${vcfoutput}Females.vcf.gz \
--assembly ${bamoutput}Females_gridss.bam \
--threads 8 \
--workingdir /data/GRIDSS/female \
--labels Jane,Adelaide,Alice,Aparima,Aranga,Atareta,Aumaria,Awarua,Bella,Boomer,Cyndy,Dusky \
/data/alignments_female/jane/jane_sim_sorted.bam /data/alignments_female/bam/sorted/Adelaide.sorted.bam /data/alignments_female/bam/sorted/Alice.sorted.bam /data/alignments_female/bam/sorted/Aparima.sorted.bam /data/alignments_female/bam/sorted/Aranga.sorted.bam /data/alignments_female/bam/sorted/Atareta.sorted.bam /data/alignments_female/bam/sorted/Aumaria.sorted.bam /data/alignments_female/bam/sorted/Awarua.sorted.bam /data/alignments_female/bam/sorted/Bella.sorted.bam /data/alignments_female/bam/sorted/Boomer.sorted.bam /data/alignments_female/bam/sorted/Cyndy.sorted.bam /data/alignments_female/bam/sorted/Dusky.sorted.bam
