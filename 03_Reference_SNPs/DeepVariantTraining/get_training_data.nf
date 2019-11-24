Channel.fromPath("../deepvariant/gvcfs/*.gvcf")
    .set { gvcfs }

Channel.fromPath("../deepvariant/gvcfs/*.vcf")
    .set { vcfs }

process generateConfidentRegions {
    input: 
        file(gvcf) from gvcfs
    output: 
        file("${gvcf.baseName}.bed") into bed_regions
    publishDir './training_data'
    tag { "${gvcf.baseName}" }
    queue 'prepost'
    time '3h'
    cpus '2'
    memory '3g'

    """
    get_confident_regions.pl ${gvcf} > ${gvcf.baseName}.bed
    """
}
