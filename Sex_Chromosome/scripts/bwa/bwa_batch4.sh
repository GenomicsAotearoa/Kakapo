#!/bin/sh
#################################################################################################
#25-06-2020 #Scripts modified from GA data carpentry workshop and an original script by
#Sophia Cameron-Christie provided by Natlie Forsdick.
#For the purpose of aligning paired-end fastq files for downstream SV calling.
#################################################################################################
#
ref=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/References/kakapo_no_Wchromosome.fna.gz #Reference genome for alignment
datadir=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/processed_reads_male/04/ #Directory with fastq data
samdir=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/alignments_male/sam/ #Sam file output
bamdir=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/alignments_male/bam/ #Bam file output
fq1=.r1.fq.gz #Read 1 suffix
fq2=.r2.fq.gz #Read 2 suffix
platform="Illumina"

#Now, retrieving read group and instrument information.
for samp in ${datadir}*${fq1} #Remember to be explicit with file location
do
        base=$(basename $samp .r1.fq.gz)
	infoline=$(zcat ${samp} | head -n 1)
	instrument=`echo ${infoline} | cut -d ':' -f1`
	instrumentrun=`echo $infoline | cut -d ':' -f2`
	flowcell=`echo $infoline | cut -d ':' -f3`
	lane=`echo $infoline | cut -d ':' -f4`
	index=`echo $infoline | cut -d ':' -f10`

	#Now to incorporate this information into the alignment
	rgid="ID:${instrument}_${instrumentrun}_${flowcell}_${lane}_${index}"
	rgpl="PL:${platform}"
	rgpu="PU:${flowcell}.${lane}"
	rglb="LB:${base}_library1"
	rgsm="SM:${base}"

        echo "Aligning reads for $base" #Be explicit with file location for read 2 and the sam file output
        bwa mem -M -R @RG'\t'$rgid'\t'$rgpl'\t'$rgpu'\t'$rglb'\t'$rgsm -t 64 $ref $samp ${datadir}${base}${fq2} > ${samdir}${base}.sam

	echo "Converting sam file to bam file for $base"
	time samtools view -@ 16 -T $ref -b ${samdir}${base}.sam > ${bamdir}${base}.bam
done