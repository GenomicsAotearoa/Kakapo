Channel.fromPath("../deepvariant/gvcfs/*.gvcf")
    .set { gvcfs }

Channel.fromPath("../deepvariant/vcfs/*.vcf")
    .set { vcfs }

process generateConfidentRegions {
    input: 
        file(gvcf) from gvcfs
    output: 
        file("${gvcf.baseName}.bed") into bed_regions
    publishDir './training_data', mode: 'copy'
    tag { "${gvcf.baseName}" }
    queue 'prepost'
    time '1h'
    cpus '2'
    memory '2g'

    """
    get_confident_regions.pl ${gvcf} > ${gvcf.baseName}.bed
    """
}

process generateConfidentSnps {
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
}
