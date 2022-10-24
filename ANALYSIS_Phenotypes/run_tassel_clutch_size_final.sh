../../TASSEL5/run_pipeline.pl \
	-Xms16g -Xmx30g \
	-fork1 -h gwas_snps_filtered_minobs_60_minaf_0.02.hapmap.txt.hmp.txt \
	-fork2 -r clutch_size_new_randomonly.tsv \
	-combine3 -input1 -input2 -intersect \
	-fork4 -k k_matrix_centered_ibs_minobs20_minaf0.2.txt \
	-combine6 -input3 -input4 \
	-mlm \
	-mlmOutputFile gwas_p3d_off_5AugMay2022/clutch_size \
	-mlmCompressionLevel None \
	-mlmVarCompEst EachMarker \
	-input3 -input4

#       -mlmVarCompEst EachMarker \
#       -fork1 -vcf /mnt/data/Kakapo/filtered.sorted.vcf \
# k_matrix_centered_ibs_minobs20_minaf0.2.txt
#        -fork4 -k /home/josephguhlin/mh_k_updated.txt \
#        -fork5 -q distance_matrix_mds_5_axes.txt \

#         -mlmMaxP 1e-3 \

