mkdir weights_gwas_p3d_off

LD_PRELOAD=/usr/local/lib/mimalloc-1.7/libmimalloc.so nice ../../TASSEL5/run_pipeline.pl \
	-Xms16g -Xmx30g \
	-fork1 -vcf /mnt/data/Kakapo/filtered.sorted.vcf \
	-fork2 -r weights_pheno.txt \
	-combine3 \
	-input1 -input2 -intersect \
	-fork4 -k k.txt \
	-combine5 -input3 -input4 \
	-mlm \
	-mlmOutputFile weights_gwas_p3d_off/weights \
	-mlmCompressionLevel None \
        -mlmVarCompEst EachMarker


# -mlmMaxP 1e-3
