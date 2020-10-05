Channel
        .fromFilePairs('power_analysis/*_{testsnp.vcf,tassel_pheno.txt}')
        .set { simulations_ch }

simulations_ch.println()
