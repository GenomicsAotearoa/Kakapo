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
labels=$(ls -lh ${container}alignments_female/bam/sorted/ | awk '{print $9}' | grep -v .bai | sort | head -n 56 | tail -n 11 | xargs | sed -e "s/.sorted.bam /,/g" | sed -e "s/.sorted.bam//g")

echo "Running GRIDSS for females"

singularity run \
-B ${container}:/data \
gridss_latest.sif \
--reference ${ref} \
--output ${vcfoutput}Females_B05.vcf.gz \
--assembly ${bamoutput}Females_B05_gridss.bam \
--threads 8 \
--labels Jane,${labels} \
--workingdir /data/GRIDSS/female \
/data/alignments_female/jane/jane_sim_sorted.bam \
/data/alignments_female/bam/sorted/Ninihi.sorted.bam \
/data/alignments_female/bam/sorted/Nora.sorted.bam \
/data/alignments_female/bam/sorted/Pearl.sorted.bam \
/data/alignments_female/bam/sorted/Pounamu.sorted.bam \
/data/alignments_female/bam/sorted/Pura.sorted.bam \
/data/alignments_female/bam/sorted/Queenie.sorted.bam \
/data/alignments_female/bam/sorted/Ra.sorted.bam \
/data/alignments_female/bam/sorted/Rakiura.sorted.bam \
/data/alignments_female/bam/sorted/Rimu.sorted.bam \
/data/alignments_female/bam/sorted/Roha.sorted.bam \
/data/alignments_female/bam/sorted/Ruth.sorted.bam 
