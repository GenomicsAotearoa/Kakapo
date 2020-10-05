#!/bin/bash/ -e
#####################################################################################
#Script for running the Delly software package. Intended for structural variant 
#calling. Delly is a program for the detection of structural variants from paired-end
#sequence data.
#####################################################################################

##Setting fixed variables
workbam=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/alignments_male/bam/sorted/
ref=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/References/kakapo_no_Wchromosome.fa
output=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/delly/germline_calling/male/

echo "WARNING! There are issues genotyping all variants at once (i.e. not using the -t flag). \
You can successfully create bcf files. However, bcftools cannot handle the different variant types in a single file. \
That is why each variant must be called and genotyped individually."

echo "Beginning initial insertion calls..."
for samp in ${workbam}*.sorted.bam
	do
	base=$(basename ${samp} .sorted.bam)
	echo "Calling Delly germline insertions for ${base}"
	time delly call -o ${output}${base}_germline.ins.bcf -g ${ref} -t INS ${samp}
done

echo "Merging all called insertions into a unified site list..."

samps=$(ls -lh ${output}*_germline.ins.bcf | awk '{print $9}' | xargs)
export LC_ALL=C; unset LANGUAGE #Known issue in Delly where you have to reset the locale prior to running 'merge'
time delly merge -o ${output}male_INS_sites.bcf ${samps}

echo "Genotyping insertions from the merged SV site list across all samples. Can be run in parallel for each sample."
for samp in ${workbam}*.sorted.bam
        do
        base=$(basename ${samp} .sorted.bam)
        echo "Genotyping insertions for ${base}"
        time delly call -g ${ref} -v ${output}male_INS_sites.bcf -o ${output}${base}.geno.ins.bcf -t INS ${samp}
done

echo "Merging all the genotyped insertions into a single BCF..."
samps=$(ls -lh ${output}*.geno.ins.bcf | awk '{print $9}' | xargs)
time bcftools merge -m id -O b -o ${output}merged_germline_INS_male.bcf ${samps}
time bcftools index ${output}merged_germline_INS_male.bcf

echo "Applying the Delly germline SV filter to called insertions..."
time delly filter -f germline -o ${output}merged_germline_INS_male_filtered.bcf ${output}merged_germline_INS_male.bcf
