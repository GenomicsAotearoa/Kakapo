## prepare.sh
Copy CRAM files (and indices) over so we can combined them. Also delete Sarah-2 due to poor read alignment (sequencing error).

## combine.nf
Combine all reads for a sample into a single CRAM file, example: Sarah_001, Sarah_002, Sarah_003, etc... go into Sarah.cram

## alignments/
This leaves combined samples in alignments/ (with indices)

## Run FreeBayes 
FreeBayes crashed in regions of high-depth due to cluster configuration. To re-run the missing ones, see the freebayes.missing.* files. Please note accuracy of FreeBayes was so low based off of pedigree inheritance (Mendelian inheritance errors) that is was quickly dropped from future analyses. 

## DeepVariant
See directories: deepvariant/, DeepVariantTraining/, and DeepVariantTraingSNPCalling/.

If you wish to do your own training for DeepVariant, I am developing a more general-purpose NextFlow pipeline that is more clear and uses the newest version. Please be in touch.

