singularity run glnexus_v1.2.3.sif glnexus_cli \
	--config DeepVariantWGS \
	-a --threads 24 vcfs/*gvcf \
	-m 32 1>vcfs/merged.gvcf 2>err.log

