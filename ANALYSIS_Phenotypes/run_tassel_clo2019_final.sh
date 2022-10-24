nice ../../TASSEL5/run_pipeline.pl \
	-Xms16g -Xmx30g \
	-fork1 -h filtered_maf0005.hmp.txt \
	-fork2 -r clo2019_tassel.csv \
	-combine3 -input1 -input2 -intersect \
	-fork4 -k 2019_k_matrix.txt \
	-combine6 -input3 -input4 \
	-mlm \
	-mlmOutputFile gwas_p3d_off_clo2019/clo2019 \
	-mlmCompressionLevel None \
	-mlmVarCompEst EachMarker \
	-input3 -input4

#       -mlmVarCompEst EachMarker \
#       -fork1 -vcf /mnt/data/Kakapo/filtered.sorted.vcf \
# k_matrix_centered_ibs_minobs20_minaf0.2.txt
#        -fork4 -k /home/josephguhlin/mh_k_updated.txt \
#        -fork5 -q distance_matrix_mds_5_axes.txt \

#         -mlmMaxP 1e-3 \

