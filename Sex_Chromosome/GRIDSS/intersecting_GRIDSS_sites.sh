#!/bin/sh
###################################################################################
#Here are some merging strategies I tested to identify structural variants shared
#across batches in MANTA.
###################################################################################

#Creating fixed variables for directories.
Min=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/GRIDSS
Mout=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/GRIDSS
Fin=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/GRIDSS
Fout=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/GRIDSS
gridss=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/GRIDSS

#In this attempt, I tried to create VCF's for files that contained only sites shared across
#batches. 

#for i in {01..09}
#	do
#	echo "Creating intersection of sites for male batch ${i}..."
#	bcftools isec -O z -o ${Mout}/GRIDSS_annotated_males_isec${i}.vcf.gz -n +9 -w ${i} \
#	${Min}/GRIDSS_males_B01.sv.annotated.vcf.gz \
#	${Min}/GRIDSS_males_B02.sv.annotated.vcf.gz \
#	${Min}/GRIDSS_males_B03.sv.annotated.vcf.gz \
#	${Min}/GRIDSS_males_B04.sv.annotated.vcf.gz \
#	${Min}/GRIDSS_males_B05.sv.annotated.vcf.gz \
#	${Min}/GRIDSS_males_B06.sv.annotated.vcf.gz \
#	${Min}/GRIDSS_males_B07.sv.annotated.vcf.gz \
#	${Min}/GRIDSS_males_B08.sv.annotated.vcf.gz \
#	${Min}/GRIDSS_males_B09.sv.annotated.vcf.gz
#	tabix ${Mout}/GRIDSS_annotated_males_isec${i}.vcf.gz
#done

#As you can see, this doens't exactly take care of merging all the vcfs into one
#file. But at least only the sites shared in all batches are called for each output
#file. To address the issue of having multiple batch files, I attempted to merge
#with...

#echo "Merging male files..."
#bcftools merge -O z -o ${Mout}/GRIDSS_annotated_male_consensus.vcf.gz \
#${Min}/GRIDSS_annotated_males_isec01.vcf.gz \
#${Min}/GRIDSS_annotated_males_isec02.vcf.gz \
#${Min}/GRIDSS_annotated_males_isec03.vcf.gz \
#${Min}/GRIDSS_annotated_males_isec04.vcf.gz \
#${Min}/GRIDSS_annotated_males_isec05.vcf.gz \
#${Min}/GRIDSS_annotated_males_isec06.vcf.gz \
#${Min}/GRIDSS_annotated_males_isec07.vcf.gz \
#${Min}/GRIDSS_annotated_males_isec08.vcf.gz \
#${Min}/GRIDSS_annotated_males_isec09.vcf.gz --force-samples

#echo "Creating index file for male consensus..."
#tabix ${Mout}/GRIDSS_annotated_male_consensus.vcf.gz

#And repeated for the females. There were less batches of females, so less files to
#find the intersection of for merging.

#for i in {01..07}
#	do
#	echo "Creating intersection of sites for female batch ${i}..."
#	bcftools isec -O z -o ${Fout}/GRIDSS_annotated_females_isec${i}.vcf.gz -n +7 -w ${i} \
#	${Fin}/GRIDSS_females_B01.sv.annotated.vcf.gz \
#	${Fin}/GRIDSS_females_B02.sv.annotated.vcf.gz \
#	${Fin}/GRIDSS_females_B03.sv.annotated.vcf.gz \
#	${Fin}/GRIDSS_females_B04.sv.annotated.vcf.gz \
#	${Fin}/GRIDSS_females_B05.sv.annotated.vcf.gz \
#	${Fin}/GRIDSS_females_B06.sv.annotated.vcf.gz \
#	${Fin}/GRIDSS_females_B07.sv.annotated.vcf.gz
#	tabix ${Fout}/GRIDSS_annotated_females_isec${i}.vcf.gz
#done

#echo "Merging female files..."
#bcftools merge -O z -o ${Fout}/GRIDSS_annotated_female_consensus.vcf.gz \
#${Fin}/GRIDSS_annotated_females_isec01.vcf.gz \
#${Fin}/GRIDSS_annotated_females_isec02.vcf.gz \
#${Fin}/GRIDSS_annotated_females_isec03.vcf.gz \
#${Fin}/GRIDSS_annotated_females_isec04.vcf.gz \
#${Fin}/GRIDSS_annotated_females_isec05.vcf.gz \
#${Fin}/GRIDSS_annotated_females_isec06.vcf.gz \
#${Fin}/GRIDSS_annotated_females_isec07.vcf.gz --force-samples

#echo "Creating index file for female consensus..."
#tabix ${Fout}/GRIDSS_annotated_female_consensus.vcf.gz

echo "Finding the intersecting sites between both males and females..."
bcftools isec -O z -o ${gridss}/GRIDSS_annotated_female_kakapo.vcf.gz -n +2 -w 1 \
	${Fout}/GRIDSS_annotated_female_consensus.vcf.gz \
	${Mout}/GRIDSS_annotated_male_consensus.vcf.gz
tabix ${gridss}/GRIDSS_annotated_female_kakapo.vcf.gz

bcftools isec -O z -o ${gridss}/GRIDSS_annotated_male_kakapo.vcf.gz -n +2 -w 2 \
	${Fout}/GRIDSS_annotated_female_consensus.vcf.gz \
	${Mout}/GRIDSS_annotated_male_consensus.vcf.gz
tabix ${gridss}/GRIDSS_annotated_male_kakapo.vcf.gz

echo "Merging male and female call sets into a single file..."
bcftools merge -O v -o ${gridss}/GRIDSS_annotated_kakapo.vcf -m all --force-samples \
	${gridss}/GRIDSS_annotated_female_kakapo.vcf.gz \
	${gridss}/GRIDSS_annotated_male_kakapo.vcf.gz

echo "Finding the intersecting sites among all kakapo batches is completed. File GRIDSS_kakapo_breakends.vcf is now ready for trio test."
