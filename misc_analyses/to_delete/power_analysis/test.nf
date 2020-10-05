Channel.of(1.00, 0.95, 0.90, 0.85, 0.80, 0.75)
	.set { penetrance_vals }

Channel.of(0.00, 0.05, 0.10, 0.15, 0.20)
	.set { error_vals }

Channel.of(0.5, 0.4, 0.3, 0.2, 0.1, 0.05, 0.03, 0.02)
	.set { pheno_freq_vals }

penetrance_vals.combine(error_vals).combine(pheno_freq_vals).set { big_list_ch }




big_list_ch.println()
