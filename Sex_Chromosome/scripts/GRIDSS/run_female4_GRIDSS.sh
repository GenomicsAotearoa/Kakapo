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
labels=$(ls -lh ${container}alignments_female/bam/sorted/ | awk '{print $9}' | grep -v .bai | sort | head -n 45 | tail -n 11 | xargs | sed -e "s/.sorted.bam /,/g" | sed -e "s/.sorted.bam//g")

echo "Running GRIDSS for females"

singularity run \
-B ${container}:/data \
gridss_latest.sif \
--reference ${ref} \
--output ${vcfoutput}Females_B04.vcf.gz \
--assembly ${bamoutput}Females_B04_gridss.bam \
--threads 8 \
--labels Jane,${labels} \
--workingdir /data/GRIDSS/female \
/data/alignments_female/jane/jane_sim_sorted.bam \
/data/alignments_female/bam/sorted/Kura.sorted.bam \
/data/alignments_female/bam/sorted/Lisa.sorted.bam \
/data/alignments_female/bam/sorted/Maggie.sorted.bam \
/data/alignments_female/bam/sorted/Mahli.sorted.bam \
/data/alignments_female/bam/sorted/Makorea.sorted.bam \
/data/alignments_female/bam/sorted/Marama.sorted.bam \
/data/alignments_female/bam/sorted/Margaret-Maree.sorted.bam \
/data/alignments_female/bam/sorted/Marian.sorted.bam \
/data/alignments_female/bam/sorted/Mila.sorted.bam \
/data/alignments_female/bam/sorted/Millie.sorted.bam \
/data/alignments_female/bam/sorted/Mukeke.sorted.bam \
