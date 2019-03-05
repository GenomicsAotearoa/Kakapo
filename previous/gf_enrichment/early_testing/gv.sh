diamond blastp --more-sensitive --query predicted_genes.aa --db ../../../../software/diamond_dbs/uniprot_swissprot.dmnd --outfmt 5 --out 6_gv_blastp.xml
genevalidator --num_threads 8 -f -o genevalidator -m 1 -x 6_gv_blastp.xml --raw_sequence /Volumes/archive/deardenlab/guhlin/software/diamond_dbs/uniprot_swissprot.raw_seq predicted_genes.aa
