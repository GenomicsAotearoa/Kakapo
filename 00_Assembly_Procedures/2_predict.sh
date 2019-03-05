export PATH=/Volumes/archive/deardenlab/guhlin/software/augustus-3.3.2/bin:$PATH
export AUGUSTUS_CONFIG_PATH=/Volumes/archive/deardenlab/guhlin/software/augustus-3.3.2/config

/Volumes/archive/deardenlab/guhlin/software/funannotate/funannotate predict \
	-i ./primary.masked.sorted.fasta \
	-o kakapo_round0 \
	-s "Strigops habroptilus" \
	--name "kakapo" \
	--augustus_species kakapo_round0 \
	--busco_seed_species generic \
	--organism other \
	--optimize_augustus \
	--busco_db aves \
	--max_intronlen 200000 \
	--protein_evidence kakapo_proteins_ncbi.fasta Nestor_notabilis.pep $FUNANNOTATE_DB/uniprot_sprot.fasta \
	--cpus 32
