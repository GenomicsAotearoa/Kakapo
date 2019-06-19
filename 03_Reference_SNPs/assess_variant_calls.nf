#!/usr/bin/env nextflow


/*
 * marissa.lelec@gmail.com
 * github.com/MarissaLL
 */




params.vcf = "data/simple_36.vcf"
vcf = file(params.vcf)


tidy_wiki_birdlist = file("old_files/formatted_bird_list_manual.csv")


vcf_tools_analyses = Channel.from("freq", "depth", "site-depth", "site-mean-depth", 
	"geno-depth", "TsTv-by-count", "TsTv-by-qual", "TsTv-summary", "missing-indv", 
	"missing-site",  "hist-indel-len")






/*01 This seems to be necessary because the freebayes vcf header is not in a valid format*/
process delete_header_info {
	publishDir './output/02_assess_vcfs/tidy_vcfs', mode: 'copy'

	conda 'bioconda::bcftools'

	input:
		vcf
	output:
		file("${vcf.baseName}_header.vcf") into tidy_header_ch

	"""
	bcftools annotate --remove INFO,FORMAT/GL,FORMAT/GQ ${vcf} > ${vcf.baseName}_header.vcf
	"""
}



/*02 Convert haplotypes to simple alleles (needed for the freebayes output)*/
process convert_allelic_primitives{
	publishDir './output/02_assess_vcfs/tidy_vcfs', mode: 'copy'

	conda 'bioconda::vcflib'

	input:
		file(tidy_header_file) from tidy_header_ch

	 output:
	 	file("${vcf.baseName}_ap.vcf") into simple_alleles_ch

	"""
	vcfallelicprimitives ${tidy_header_file} -kg > ${vcf.baseName}_ap.vcf
	"""
}


/*03 Deduplicate variants after converting haplotypes to allelic primatives*/
process deduplicate_variants{
	executor 'local'
	publishDir './output/02_assess_vcfs/tidy_vcfs', mode: 'copy'

	conda 'bioconda::bcftools'

	input:
		file(ap_file) from simple_alleles_ch

	output:
		file("${vcf.baseName}_dedup.vcf") into (dedup_vcf, dedup_vcf2, dedup_vcf3, dedup_vcf4)

	"""
	bcftools norm -d all ${ap_file} > ${vcf.baseName}_dedup.vcf
	"""
}




/* 04 Generate summary statistics for the vcfs*/
process get_vcf_stats_3{
	publishDir './output/02_assess_vcfs/tidy_vcfs'
	
	conda 'bioconda::vcftools'

	input:
		file(dedup_file) from dedup_vcf
		each vcf_tool_analysis from vcf_tools_analyses
	output:
		file("${vcf.baseName}_${vcf_tool_analysis}") into vcf_stats_ch

	"""
	vcftools --vcf ${dedup_file} --${vcf_tool_analysis} --out ${vcf.baseName}
	mv ${vcf.baseName}.* ${vcf.baseName}_${vcf_tool_analysis}
	"""
}



process plot_vcf_stats{
	publishDir './output/02_assess_vcfs/tidy_vcfs', mode: 'copy'

	input:
		set file(result1),
			file(result2),
			file(result3),
			file(result4),
			file(result5),
			file(result6),
			file(result7),
			file(result8),
			file(result9),
			file(result10),
			file(result11) from vcf_stats_ch.collect()
	output:
		file("${vcf.baseName}_vcfstats.pdf")

	"""
	echo ${vcf.baseName} > ${vcf.baseName}.txt
	Rscript ${baseDir}/src/vcf_summary_plots.R ${vcf.baseName}.txt ${result1} ${result2} \
	${result3} ${result4} ${result5} ${result6} ${result7} ${result8} \
	${result9} ${result10} ${result11} 
	"""


}


/*QUALITY FILTERING HERE*/





process make_files_for_mendel_errors{
	publishDir './output/02_assess_vcfs/mendelian_errors', mode: 'copy'

	input:
		file(dedup_vcf2) from dedup_vcf3
		tidy_wiki_birdlist
	output:
		file("contig_map.txt") into contig_map
		file("chrom_map.txt") into chrom_map
		file("all_trio_names.txt") into trio_names
		file("all_trio_id.txt") into trio_ids
		file("all_trio_parents.txt") into trio_parents
		file("all_trio_id_sex.txt") into trio_id_sex

		"""
		grep "contig" ${dedup_vcf2[0]} > contig_map.txt
		grep "CHROM" ${dedup_vcf2[0]} | cut -f 9- > seq_indiv.txt
		Rscript ${baseDir}/src/make_plink_files.R ${tidy_wiki_birdlist} seq_indiv.txt contig_map.txt chrom_map.txt \
		all_trio_names.txt all_trio_id.txt all_trio_parents.txt all_trio_id_sex.txt
		"""
}


/* Convert the vcf to ped for use by plink*/
process convert_to_ped{
	executor 'local'
	publishDir './output/02_assess_vcfs/mendelian_errors', mode: 'copy'

	conda 'bioconda::vcftools'

	input:
		file(vcf_for_ped) from dedup_vcf4
		file(map_file) from contig_map
	output:
		set file("${vcf.baseName}_trios.ped"),
			file("${vcf.baseName}_trios.map") into ped_file

	"""
	vcftools --vcf ${vcf_for_ped} --plink --chrom-map ${map_file} --out ${vcf.baseName}_trios
	"""
}


/*Update the family IDs in the PED so plink is happy*/
process update_ped_ids{
	executor 'local'
	publishDir './output/02_assess_vcfs/mendelian_errors', mode: 'copy'

	conda 'bioconda::plink'

	input:
		set file(ped),
			file(map) from ped_file
		file(id_info) from trio_ids
	output:
		set file("${vcf.baseName}_trios_ids.ped"),
			file("${vcf.baseName}_trios_ids.map") into ped_ids

	"""
	plink --file ${ped.baseName} \
	--update-ids ${id_info} \
	--recode --out ${vcf.baseName}_trios_ids
	"""
}

/*Add information about relationship and sex to the PED file*/
process update_other_details{
	executor 'local'
	publishDir './output/02_assess_vcfs/mendelian_errors', mode: 'copy'

	conda 'bioconda::plink'

	input:
		set file(ped),
			file(map) from ped_ids
		file(parents_info) from trio_parents
		file(sex_info) from trio_id_sex
	output:
		set file("${vcf.baseName}_trios_all_info.ped"),
			file("${vcf.baseName}_trios_all_info.map") into ped_all_info

	"""
	plink --file ${ped.baseName} \
	--update-parents ${parents_info} \
	--update-sex ${sex_info} \
	--recode \
	--out ${vcf.baseName}_trios_all_info
	"""
}



/*Calculate mendelian errors for all the trios*/
process calculate_mendel_errors{
	executor 'local'
	publishDir './output/02_assess_vcfs/mendelian_errors', mode: 'copy'

	conda 'bioconda::plink'

	input:
		set file(ped),
			file(map) from ped_all_info
	output:
		file("${vcf.baseName}_all_trios.mendel")
		file("${vcf.baseName}_all_trios.fmendel")
		file("${vcf.baseName}_all_trios.imendel")
		file("${vcf.baseName}_all_trios.lmendel")

	"""
	plink --file ${ped.baseName} \
	--mendel \
	--out ${vcf.baseName}_all_trios
	"""
}
