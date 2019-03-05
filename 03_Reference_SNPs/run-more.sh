bwa mem \
	-t 32 \
	../primary.masked.sorted.fasta \
	../QC/results/AdapterRemovalV2/C9EP8ANXX-1983-01-4-1_L002.pair1.truncated \
	../QC/results/AdapterRemovalV2/C9EP8ANXX-1983-01-4-1_L002.pair2.truncated |
samtools view -T ../primary.masked.sorted.fasta -C - > out.L002.cram

samtools view -hT ../primary.masked.sorted.fasta out.L002.cram | samtools sort --reference ../primary.masked.sorted.fasta -O CRAM -l 9 -m 4G --threads 16 -o out.sorted.L002.cram

samtools index out.sorted.L002.cram

bwa mem \
        -t 32 \
        ../primary.masked.sorted.fasta \
        ../QC/results/AdapterRemovalV2/C9EP8ANXX-1983-01-4-1_L003.pair1.truncated \
        ../QC/results/AdapterRemovalV2/C9EP8ANXX-1983-01-4-1_L003.pair2.truncated |
samtools view -T ../primary.masked.sorted.fasta -C - > out.L003.cram

samtools view -hT ../primary.masked.sorted.fasta out.L003.cram | samtools sort --reference ../primary.masked.sorted.fasta -O CRAM -l 9 -m 4G --threads 16 -o out.sorted.L003.cram

samtools index out.sorted.L003.cram


bwa mem \
        -t 32 \
        ../primary.masked.sorted.fasta \
        ../QC/results/AdapterRemovalV2/C9EP8ANXX-1983-01-4-1_L004.pair1.truncated \
        ../QC/results/AdapterRemovalV2/C9EP8ANXX-1983-01-4-1_L004.pair2.truncated |
samtools view -T ../primary.masked.sorted.fasta -C - > out.L004.cram

samtools view -hT ../primary.masked.sorted.fasta out.L004.cram | samtools sort --reference ../primary.masked.sorted.fasta -O CRAM -l 9 -m 4G --threads 16 -o out.sorted.L004.cram

samtools index out.sorted.L004.cram

bwa mem \
        -t 32 \
        ../primary.masked.sorted.fasta \
        ../QC/results/AdapterRemovalV2/C9EP8ANXX-1983-01-4-1_L005.pair1.truncated \
        ../QC/results/AdapterRemovalV2/C9EP8ANXX-1983-01-4-1_L005.pair2.truncated |
samtools view -T ../primary.masked.sorted.fasta -C - > out.L005.cram

samtools view -hT ../primary.masked.sorted.fasta out.L005.cram | samtools sort --reference ../primary.masked.sorted.fasta -O CRAM -l 9 -m 4G --threads 16 -o out.sorted.L005.cram

samtools index out.sorted.L005.cram


bwa mem \
        -t 32 \
        ../primary.masked.sorted.fasta \
        ../QC/results/AdapterRemovalV2/C9EP8ANXX-1983-01-4-1_L006.pair1.truncated \
        ../QC/results/AdapterRemovalV2/C9EP8ANXX-1983-01-4-1_L006.pair2.truncated |
samtools view -T ../primary.masked.sorted.fasta -C - > out.L006.cram

samtools view -hT ../primary.masked.sorted.fasta out.L006.cram | samtools sort --reference ../primary.masked.sorted.fasta -O CRAM -l 9 -m 4G --threads 16 -o out.sorted.L006.cram

samtools index out.sorted.L006.cram

