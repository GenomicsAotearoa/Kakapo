mkdir growthM_gwas_p3d_on_r15

../../TASSEL5/run_pipeline.pl \
	-Xms16g -Xmx30g \
	-fork1 -vcf /mnt/data/Kakapo/filtered.sorted.vcf \
	-fork2 -r pheno_reps_M_r25.txt \
	-combine3 \
	-input1 -input2 -intersect \
	-fork4 -k /home/josephguhlin/mh_k_updated.txt \
	-combine5 -input3 -input4 \
	-mlm \
	-mlmOutputFile final_gwas_robustness_p3d_off/M_rep \
	-mlmCompressionLevel None \
	-mlmMaxP 1e-3

#       -mlmVarCompEst EachMarker \

