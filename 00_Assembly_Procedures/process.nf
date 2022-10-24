
// Funannotate
// version:     1.5.1-439a664
//
// RepeatMasker
// #    Revision 1.331  2017/02/01 21:01:55  rhubley
//
// RepeatModeler
// open-1.0.11
//

// This script replaces the previous scripts....
params.reference = "https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/004/027/225/GCA_004027225.2_bStrHab1.2.pri/GCA_004027225.2_bStrHab1.2.pri_genomic.fna.gz"

reference = params.reference

process downloadReference {

  storeDir './store/downloaded'
  publishDir './downloaded'
  cache true

  input:
    reference

  output:
    file("assembly.fasta") into assembly

    """
    wget ${reference} -O assembly.fasta.gz
    gunzip assembly.fasta.gz
    """
}
