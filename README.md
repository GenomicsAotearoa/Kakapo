# Kakapo Genome Data

[NCBI Kakapo Taxonomy ID](https://www.ncbi.nlm.nih.gov/Taxonomy/Browser/wwwtax.cgi?id=57251)

## Genome Availability
The Kakapo genome is published through the Vertebrate Genomes Project and is available here:
[Kakapo Genome 7 Sept 2018](https://vgp.github.io/genomeark/Strigops_habroptilus/)
The Primary assembly is used in these scripts

## Other Data Availability
Kakapo data is available through the DOC. This repository is for those with access to the data.

## Quick Note
**Many of the tools here may be moved to git submodules, as I am trying to make sure they are reusable as much as possible**
NextFlow (the pipeline tool I am using) lets you work directly from git repos so they will likely be moving into their own in the near future.
--Joseph

# Methods

## Assembly_Procedures
Masking, sorting, and initial gene prediction (not final)

## QC & Adapter Trimming
In QC Folder

Adapter Trimming, base quality trimming, and merging performed with [AdapterRemovalV2](https://github.com/MikkelSchubert/adapterremoval). FastQC is run on both pre-processed (MultiQC_1) and post-processed (MultiQC_2).
QC Results are/will be available on our [Google Drive](https://drive.google.com/open?id=1rKB0EycINaNLAhBBjduaOGPyt-RJrllz).


## Structural Variation
### ChrZ --> for a specific group

## Other Analyses
TBD

# Scripts

# Dependencies
* [AdapterRemovalV2](https://github.com/MikkelSchubert/adapterremoval)
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
