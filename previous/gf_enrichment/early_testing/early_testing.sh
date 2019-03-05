cat ../predicted_genes_raw/* > predicted_genes.unprocessed.gff3
clojure ../scripts/rename_genes.clj sprot kakapo > predicted_genes.gff3
perl ../../../../software/augustus-3.3.2/scripts/getAnnoFasta.pl predicted_genes.gff3 --seqfile ../../primary.masked.sorted.fasta
transeq -sequence predicted_genes3.codingseq -outseq predicted_genes.aa
grep -c ">" predicted_genes.aa
