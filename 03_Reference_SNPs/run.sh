bwa mem \
	-t 32 \
	../primary.masked.sorted.fasta \
	../QC/results/AdapterRemovalV2/C9EP8ANXX-1983-01-4-1_L001.pair1.truncated \
	../QC/results/AdapterRemovalV2/C9EP8ANXX-1983-01-4-1_L001.pair2.truncated |
samtools view -T ../primary.masked.sorted.fasta -C - > out.cram

samtools view -hT ../primary.masked.sorted.fasta out.cram | samtools sort --reference ../primary.masked.sorted.fasta -O CRAM -l 9 -m 4G --threads 16 -o out.sorted.cram

samtools index out.sorted.cram
