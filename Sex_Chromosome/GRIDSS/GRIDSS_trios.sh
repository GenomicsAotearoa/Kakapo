#!/bin/bash
###################################################################################
#Here I am attempting to conduct the trio binning for the called SV's. The 
#sample_trios file was modified from the Pedigree_19_July_2020.filtered.txt file. 
#In all, there are 124 trios for comparison.
###################################################################################

#First began by creating fixed variables
manta=/scale_wlg_nobackup/filesets/nobackup/uoo02695/software/manta-1.6.0.centos6_x86_64/libexec/denovo_scoring.py
trio=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/manta/trios/sample_trios
output=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/GRIDSS/trios
vcf=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/GRIDSS/GRIDSS_annotated_kakapo.vcf

#Then edited text from the 'sample_trios' file to work for the appropriate BCFtools
#flags...
cd ${output}

#The manta script automatically writes out to a new file. The name this file is 
#written to cannot be changed as far as I know. To address this, I'm creating vcf's
#for each individual trio comparison and running the de novo pipeline as per below.
while read -r line
    do
    fam=$(echo ${line} | sed 's/ /,/g')
    indiv=$(echo ${line} | awk '{print $1}')
    gridssfam=$(echo ${line})
    echo "Creating trio VCF for ${line}"
    bcftools view -O v -o ${indiv}_trio.vcf -s ${fam} ${vcf}
    echo "Testing trio for ${indiv}..."
    ${manta} ${indiv}_trio.vcf ${gridssfam}
done < ${trio}

#Finally, I'm merging the stats generated from MANTA into one file.
for stat in *_trio.de_novo.stats.txt
    do
    base=$(basename ${stat} _trio.de_novo.stats.txt)
    echo ${base} >> all_stats.txt
    cat ${stat} >> all_stats.txt
done

#Now to see how many of these non-mendelian sites are shared in the population
for vcf in *_trio.de_novo.vcf
    do
    bgzip ${vcf}
    tabix ${vcf}.gz
done

ls -lh *_trio.de_novo.vcf.gz | awk '{print $9}' | xargs > 2isec

while read -r line
    do 
    bcftools isec -O v -o GRIDSS_NoMendel.vcf -n +124 ${line} > failed_sites
done < 2isec

#Turns out that none of these sites are shared among all individuals....
#So to get all the sites not adhering to mendelian inheritance, I first
#created a file with these individuals and sites.

for samp in *_trio.de_novo.vcf.gz
    do
    indiv=$(basename ${samp} _trio.de_novo.vcf.gz)
    echo "Creating VCF of failed sites for ${indiv}..."
    bcftools view -O z -o ${indiv}_noMendel.vcf.gz -i '(DQ)==60' -s ${indiv} ${samp}
    echo "Now indexing VCF of failed sites for ${indiv}..."
    tabix ${indiv}_noMendel.vcf.gz
done

ls -lh *_noMendel.vcf.gz | awk '{print $9}' | xargs > 2merge

while read -r line
    do
    echo "Merging all failed sites..."
    bcftools merge -O v -o all_GRIDSS_noMendel.vcf -m all ${line}
done < 2merge
