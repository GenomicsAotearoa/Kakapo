
// This script replaces the previous scripts....
params.reference = "ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/004/027/225/GCA_004027225.1_bStrHab1_v1.p/GCA_004027225.1_bStrHab1_v1.p_genomic.fna.gz"

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

// Next step requires funannotate to be installed and properly set-up
process maskReference {
  cpus 32

  conda '/Volumes/userdata/staff_users/josephguhlin/anaconda3/envs/funannotate'

  storeDir './store/masked'
  publishDir "./masked"

  input:
    file(assembly) from assembly

  output:
    file("assembly.masked.fasta") into masked

  """
  /Volumes/archive/deardenlab/guhlin/software/funannotate/funannotate \
    mask \
    -i ${assembly} -o assembly.masked.fasta --cpus 32
  """
}
