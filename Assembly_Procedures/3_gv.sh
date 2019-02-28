diamond blastp --query kakapo_round0/predict_results/Strigops_habroptilus.proteins.fa --db ../../software/diamond_dbs/uniprot_swissprot.dmnd --outfmt 5 --out 3_gv_blastp_swissprot.xml

/Volumes/archive/deardenlab/guhlin/software/genevalidator/genevalidator \
  --num_threads 8 \
  -f \
  -o 3_genevalidator_results \
  -m 16 \
  -x 3_gv_blastp_swissprot.xml \
  --raw_sequence /Volumes/archive/deardenlab/guhlin/software/diamond_dbs/uniprot_swissprot.raw_seq \
  kakapo_round0/predict_results/Strigops_habroptilus.proteins.fa

