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
labels=$(ls -lh ${container}alignments_female/bam/sorted/ | awk '{print $9}' | grep -v .bai | sort | head -n 78 | tail -n 9 | xargs | sed -e "s/.sorted.bam /,/g" | sed -e "s/.sorted.bam//g")

echo "Running GRIDSS for females"

singularity run \
-B ${container}:/data \
gridss_latest.sif \
--reference ${ref} \
--output ${vcfoutput}Females_B07.vcf.gz \
--assembly ${bamoutput}Females_B07_gridss.bam \
--threads 8 \
--labels Jane,${labels} \
--workingdir /data/GRIDSS/female \
/data/alignments_female/jane/jane_sim_sorted.bam \
/data/alignments_female/bam/sorted/Toitiiti.sorted.bam \
/data/alignments_female/bam/sorted/Tukaha.sorted.bam \
/data/alignments_female/bam/sorted/Tumeke.sorted.bam \
/data/alignments_female/bam/sorted/Waa.sorted.bam \
/data/alignments_female/bam/sorted/Waikawa.sorted.bam \
/data/alignments_female/bam/sorted/Weheruatanga-o-te-po.sorted.bam \
/data/alignments_female/bam/sorted/Wendy.sorted.bam \
/data/alignments_female/bam/sorted/Yasmine.sorted.bam \
/data/alignments_female/bam/sorted/Zephyr.sorted.bam
