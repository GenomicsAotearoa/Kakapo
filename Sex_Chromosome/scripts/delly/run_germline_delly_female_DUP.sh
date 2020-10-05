#!/bin/bash/ -e
#####################################################################################
#Script for running the Delly software package. Intended for structural variant 
#calling. Delly is a program for the detection of structural variants from paired-end
#sequence data.
#####################################################################################

##Setting fixed variables
workbam=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/alignments_female/bam/sorted/
ref=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/References/kakapo_full_ref.fa
control=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/alignments_female/jane/jane_sim_sorted.bam
output=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/delly/germline_calling/female/

echo "WARNING! There are issues genotyping all variants at once (i.e. not using the -t flag). \
You can successfully create bcf files. However, bcftools cannot handle the different variant types in a single file. \
That is why each variant must be called and genotyped individually."

echo "Beginning initial duplication calls..."
for samp in ${workbam}*.sorted.bam
	do
	base=$(basename ${samp} .sorted.bam)
	echo "Calling Delly germline duplications for ${base}"
	time delly call -o ${output}${base}_germline.dup.bcf -g ${ref} -t DUP ${samp}
done

echo "Merging all called duplications into a unified site list..."
samps=$(ls -lh ${output}*_germline.dup.bcf | awk '{print $9}' | xargs)
export LC_ALL=C; unset LANGUAGE #Known issue in Delly where you have to reset the locale prior to running 'merge'
time delly merge -o ${output}female_DUP_sites.bcf ${samps}

echo "Genotyping duplications from the merged SV site list across all samples. Can be run in parallel for each sample."
for samp in ${workbam}*.sorted.bam
	do
	base=$(basename ${samp} .sorted.bam)
	echo "Genotyping duplications for ${base}"
	time delly call -g ${ref} -v ${output}female_DUP_sites.bcf -o ${output}${base}.geno.dup.bcf -t DUP ${samp}
done

echo "Merging all the genotyped duplications into single BCF..."
samps=$(ls -lh ${output}*.geno.dup.bcf | awk '{print $9}' | xargs)
time bcftools merge -m id -O b -o ${output}merged_germline_DUP_female.bcf ${samps}
time bcftools index ${output}merged_germline_DUP_female.bcf

echo "Applying the Delly germline SV filter to the merged duplications..."
time delly filter -f germline -o ${output}merged_germline_DUP_female_filtered.bcf ${output}merged_germline_DUP_female.bcf
