bwa mem \
	-t 32 \
	../primary.masked.sorted.fasta \
	../QC/results/AdapterRemovalV2/C9EP8ANXX-1983-01-4-1_L001.collapsed |
samtools view -T ../primary.masked.sorted.fasta -C - > out.collapsed.cram

samtools view -hT ../primary.masked.sorted.fasta out.collapsed.cram | samtools sort --reference ../primary.masked.sorted.fasta -O CRAM -l 9 -m 4G --threads 16 -o out.collapsed.sorted.cram

samtools index out.collapsed.sorted.cram


bwa mem \
        -t 32 \
        ../primary.masked.sorted.fasta \
        ../QC/results/AdapterRemovalV2/C9EP8ANXX-1983-01-4-1_L002.collapsed |
samtools view -T ../primary.masked.sorted.fasta -C - > out.L002.collapsed.cram

samtools view -hT ../primary.masked.sorted.fasta out.L002.collapsed.cram | samtools sort --reference ../primary.masked.sorted.fasta -O CRAM -l 9 -m 4G --threads 16 -o out.L002.collapsed.sorted.cram

samtools index out.L002.collapsed.sorted.cram

bwa mem \
        -t 32 \
        ../primary.masked.sorted.fasta \
        ../QC/results/AdapterRemovalV2/C9EP8ANXX-1983-01-4-1_L003.collapsed |
samtools view -T ../primary.masked.sorted.fasta -C - > out.L003.collapsed.cram

samtools view -hT ../primary.masked.sorted.fasta out.L003.collapsed.cram | samtools sort --reference ../primary.masked.sorted.fasta -O CRAM -l 9 -m 4G --threads 16 -o out.L003.collapsed.sorted.cram

samtools index out.L003.collapsed.sorted.cram

bwa mem \
        -t 32 \
        ../primary.masked.sorted.fasta \
        ../QC/results/AdapterRemovalV2/C9EP8ANXX-1983-01-4-1_L004.collapsed |
samtools view -T ../primary.masked.sorted.fasta -C - > out.L004.collapsed.cram

samtools view -hT ../primary.masked.sorted.fasta out.L004.collapsed.cram | samtools sort --reference ../primary.masked.sorted.fasta -O CRAM -l 9 -m 4G --threads 16 -o out.L004.collapsed.sorted.cram

samtools index out.L004.collapsed.sorted.cram

bwa mem \
        -t 32 \
        ../primary.masked.sorted.fasta \
        ../QC/results/AdapterRemovalV2/C9EP8ANXX-1983-01-4-1_L005.collapsed |
samtools view -T ../primary.masked.sorted.fasta -C - > out.L005.collapsed.cram

samtools view -hT ../primary.masked.sorted.fasta out.L005.collapsed.cram | samtools sort --reference ../primary.masked.sorted.fasta -O CRAM -l 9 -m 4G --threads 16 -o out.L005.collapsed.sorted.cram

samtools index out.L005.collapsed.sorted.cram

bwa mem \
        -t 32 \
        ../primary.masked.sorted.fasta \
        ../QC/results/AdapterRemovalV2/C9EP8ANXX-1983-01-4-1_L006.collapsed |
samtools view -T ../primary.masked.sorted.fasta -C - > out.L006.collapsed.cram

samtools view -hT ../primary.masked.sorted.fasta out.L006.collapsed.cram | samtools sort --reference ../primary.masked.sorted.fasta -O CRAM -l 9 -m 4G --threads 16 -o out.L006.collapsed.sorted.cram

samtools index out.L006.collapsed.sorted.cram

