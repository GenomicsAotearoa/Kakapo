wget https://s3.amazonaws.com/genomeark/species/Strigops_habroptilus/bStrHab1/assembly_curated/bStrHab1.pri.cur.20191108.fasta.gz
gunzip bStrHab1.pri.cur.20191108.fasta.gz
mv bStrHab1.pri.cur.20191108.fasta updated_reference.fasta
bwa index updated_reference.fasta
