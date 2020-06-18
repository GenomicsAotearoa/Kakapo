Channel.fromPath("../deepvariant/gvcfs/*.gvcf")
    .set { gvcfs }

Channel.fromPath("../deepvariant/vcfs/*.vcf")
    .set { vcfs }

Channel.fromPath("../alignments.original_reference/*cram")
    .set { crams }

reference = file("/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/03_Reference_SNPs/ref/assembly.fasta")

process generateConfidentRegions {
    input: 
        file(cram) from crams
    output: 
        file("${cram.baseName}.bed") into bed_regions
    publishDir './training_data', mode: 'copy'
    tag { "${cram.baseName}" }
    queue 'prepost'
    time '1h'
    cpus '2'
    memory '2g'
    conda 'bioconda::samtools'

    """
    samtools depth -q 10 -Q 10 -d 200 --reference=${reference} ${cram} | get_confident_regions.pl > ${cram.baseName}.bed
    """
}

/* process generateConfidentSnps {
    input: 
        file(vcf) from vcfs
    output: 
        file("confident/${vcf.baseName}.vcf") into vcf_snps
    publishDir './training_data', mode: 'copy'
    tag { "${vcf.baseName}" }
    queue 'prepost'
    time '1h'
    cpus '2'
    memory '2g'

    """
    mkdir confident/
    get_confident_snps.pl ${vcf} ${vcf.baseName} > confident/${vcf.baseName}.vcf
    """
} */
