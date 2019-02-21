# Kakapo Genome Data

[NCBI Kakapo Taxonomy ID](https://www.ncbi.nlm.nih.gov/Taxonomy/Browser/wwwtax.cgi?id=57251)

## Genome Availability
The Kakapo genome is published through the Vertebrate Genomes Project and is available here:
[Kakapo Genome 7 Sept 2018](https://vgp.github.io/genomeark/Strigops_habroptilus/)
The Primary assembly is used in these scripts

## Other Data Availability
Kakapo data is available through the DOC. This repository is for those with access to the data.

# Methods

## Gene Annotation

### 0_mask.sh
Uses Funannotate mask command to run RepeatModeler and RepeatMasker on the genome

### 1_sort.sh
Sort's the genome by size and renames the scaffolds

### 2_predict.sh
Run initial gene prediction on the kakapo genome. Uses generic as the initial augustus species,
trains a "kakapo_round0" species. Runs BUSCO, optimizes augustus, and uses protein evidence of
all kakapo proteins from NCBI, proteins from Nestor notabilis, and UniProt SWISS-PROT. Max intron length set to 200kbp. Results are found below under 3_gv.sh and BUSCO score at C:6.7%[S:6.7%,D:0.0%],F:0.0%,M:93.3%,n:4915

```
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
```

### 3_gv.sh
Runs GeneValidator on the predicted proteins. Results are:

```
num_predictions,20046
num_good_predictions,378
num_bad_predictions,19668
num_predictions_with_insufficient_blast_hits,11558
first_quartile_of_scores,0.0
second_quartile_of_scores,0.0
third_quartile_of_scores,45.0
```

### gf_enrichment/main.nf
Performs exhaustive gene prediction using kakapo_round0 species configuration.
Can be provided individual families, however for Kakapo we are using UniProt SWISS-PROT
Current run-time > 1 week. *A more portable version of this is in development for general usage.*

#### splitAssembly
Splits the assembly into separate files for each contig/scaffold. This provides us with 100 FASTA files representing a scaffold or contig.

#### preprocessProteinFile
Clusters provided family file (UniProt SWISS-PROT) using diamond and mcl. For Swiss-PROT generated 12,357 families.

#### generateProteinFamilySequences
For each family generated, run scripts/split_groups.pl
This extracts the specified proteins into individual files, deleting any that consist of only 1 protein.

#### generateProteinProfiles
Performs an alignment on each family sequence multifasta file, then creates an Augustus-PPX protein profile.
If a profile is unable to be created, run Augustus prepareAlign and try again. If profile is still empty delete it.
This left us with 5,652 protein profiles. Early testing puts BUSCO at C:4.8%[S:2.2%,D:2.6%],F:5.8%,M:89.4%,n:4915.

Alignment is as follows:
```
  mafft --anysymbol --thread 16 --maxiterate 1000 --localpair --reorder $unaligned > ${unaligned.baseName}.aln
```

#### genePrediction
For each family and contig/scaffold combination, run fastBlockSearch with a 0.8 cutoff and output all matches.
The run scripts/prfl_process.pl which performs Augustus gene prediction on matched regions plus additional
1.5kbp flanking sequence. This is still running but so far (22 Feb 2019) has identified 155,580 potential genes, many of which are likely duplicates or low-quality.

#### renameGenes
Rename genes so that all can be put into a single file. Also extracts putative coding and protein sequences for each predicted gene.

### Future Plans
Gene prediction will be further optimized and iterated, and additional rounds performed on Kakapo using high-scoring
predictions from round0 and gf_enrichment. Augustus-CGP mode may also be performed with related species.

Eventually the best gene predictions will be integrated and combined to provide the best possible annotation.

## Structural Variation
### ChrZ --> for a specific groupo

## Other Analyses
TBD

# Scripts

# Dependencies
* [Funannotate](https://github.com/nextgenusfs/funannotate) 1.5.1-439a664
  * RepeatModeler
  * RepeatMasker
  * [Augustus](https://github.com/Gaius-Augustus/Augustus) 3.3.2
* GeneValidator
* Nextflow
  * clojure
  * perl
  * diamond
  * samtools
  * mcl
  * Augustus 3.3.2
  * EMBOSS
