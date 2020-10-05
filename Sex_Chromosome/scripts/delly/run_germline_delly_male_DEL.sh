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

echo "Beginning initial deletion calls..."
for samp in ${workbam}*.sorted.bam
	do
	base=$(basename ${samp} .sorted.bam)
	echo "Calling Delly germline inversions for ${base}"
	time delly call -o ${output}${base}_germline.del.bcf -g ${ref} -t DEL ${samp}
done

echo "Merging all called deletions into a unified site list..."
samps=$(ls -lh ${output}*_germline.del.bcf | awk '{print $9}' | xargs)
export LC_ALL=C; unset LANGUAGE #Known issue in Delly where you have to reset the locale prior to running 'merge'
time delly merge -o ${output}male_DEL_sites.bcf ${samps}

echo "Genotyping deletions from the merged SV site list across all samples. Can be run in parallel for each sample."

for samp in ${workbam}*.sorted.bam
        do
        base=$(basename ${samp} .sorted.bam)
        echo "Genotyping deletions for ${base}"
        time delly call -g ${ref} -v ${output}male_DEL_sites.bcf -o ${output}${base}.geno.del.bcf -t DEL ${samp}
done

echo "Merging all the genotyped deletions into a single BCF..."
samps=$(ls -lh ${output}*.geno.del.bcf | awk '{print $9}' | xargs)
time bcftools merge -m id -O b -o ${output}merged_germline_DEL_male.bcf ${samps}
time bcftools index ${output}merged_germline_DEL_male.bcf

echo "Applying the Delly germline SV filter to the merged deletions..."
time delly filter -f germline -o ${output}merged_germline_DEL_male_filtered.bcf ${output}merged_germline_DEL_male.bcf
