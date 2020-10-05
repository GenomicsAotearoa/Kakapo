Channel
        .fromFilePairs('power_analysis/*_{testsnp.vcf,tassel_pheno.txt}')
        .set { simulations_ch }

first_half_vcf = file("all_first_half.vcf")
second_half_vcf = file("all_second_half.vcf")
rename = file("rename_chrs.txt")
k = file("global_tassel_kinship.txt")
plscript = file("gen_tassel_plink_script.pl")
pyscript_t = file("get_tassel_vals.py")
pyscript_f = file("get_plink_vals_firth.py")
pyscript_p = file("get_plink_vals.py")
plinkfam = file("plink2.fam.bak")
simscript = file("power_simulation.py")

cov = file("cov.tsv")

Channel.of(1.00, 0.95, 0.90, 0.85, 0.80, 0.75)
        .set { penetrance_vals }

Channel.of(0.00, 0.05, 0.10, 0.15, 0.20)
        .set { error_vals }

Channel.of(0.5, 0.4, 0.3, 0.2, 0.1, 0.05, 0.03, 0.02)
        .set { pheno_freq_vals }

penetrance_vals.combine(error_vals).combine(pheno_freq_vals).set { big_list_ch }

// python ../power_simulation.py --vcf ../all_snps.maf.vcf.gz --penetrance 1. --pheno_frequency 0.25 --error 0 --pos 122999 --landmark S1 --snpid TEST_SNP --out batch1 --plink_family Kakapo -n 50

process runAnalyses {
        executor 'slurm'
	input:
		tuple val(penetrance), val(error), val(pheno_freqs) from big_list_ch
		first_half_vcf
		second_half_vcf
		plscript
		pyscript_t
		pyscript_p
		k
		cov
		plinkfam
	output:
		file("*.stats")
	errorStrategy 'retry'
	maxRetries 16
	time '12h'
	cpus 4
	memory '32G'
	queue 'large'
	conda 'python==3.7 bioconda::bcftools numpy pandas cyvcf2'
	publishDir 'GwasOutput', mode: 'move'

"""
python ${simscript} \
	--vcf ${first_half_vcf} \
	--penetrance ${penetrance} \
	--pheno_frequency ${pheno_freqs} \
	--error ${error} \
	--pos 112999 \
	--landmark 9 \
	--snpid TEST_SNP \
	--out batch \
	--plink_family Kakapo \
	-n 30

	perl ${plscript} ${first_half_vcf} ${second_half_vcf} ${k} ${pyscript_t} ${pyscript_p} ${cov} ${plinkfam} ${pyscript_f} > doit.bash
	bash doit.bash


"""
}
