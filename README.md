# Now Published
[Species-wide genomics of kākāpō provides tools to accelerate recovery](https://www.nature.com/articles/s41559-023-02165-y)

# Kākāpō Genome Data

[NCBI Kākāpō Taxonomy ID](https://www.ncbi.nlm.nih.gov/Taxonomy/Browser/wwwtax.cgi?id=57251)

## Genome Availability
The Kākāpō genome is published through the Vertebrate Genomes Project and is available from NCBI:
[Kākāpō Genome 7 Sept 2018](https://www.ncbi.nlm.nih.gov/assembly/GCF_004027225.2/)
The Primary assembly is used in these scripts.

## Other Data Availability
Kākāpō data is available through the DOC and it is possible to request it here: https://data.agdr.org.nz/

# Methods

## 00_Assembly_Procedures
Downloads the assembly. Assembly from NCBI is already masked, although we may want to identify repeats for use in the publication.

## 01_QC: QC & Adapter Trimming
In QC Folder

Adapter Trimming, base quality trimming, and merging performed FASTP and with [AdapterRemovalV2](https://github.com/MikkelSchubert/adapterremoval). FastQC is run on both pre-processed (MultiQC_1) and post-processed (MultiQC_2).
QC Results are be available on [Google Drive](https://drive.google.com/open?id=1rKB0EycINaNLAhBBjduaOGPyt-RJrllz). Right click and select "Download" then open the downloaded file.

## 02_Alignments_to_Reference
BWA Mapping to align each lane of sequencing to the reference genome. Samples are renamed to the bird name + lane number. MultiQC report generated for alignment statistics is available on Google Drive.

## 03_Reference_SNPs
FreeBayes, DeepVariant, and GATK.
