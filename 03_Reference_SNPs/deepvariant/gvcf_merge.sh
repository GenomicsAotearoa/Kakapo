singularity run glnexus_v1.2.2.sif glnexus_cli --config DeepVariantWGS -a --threads 24 *final.gvcf -m 16 1>merged.gvcf 2>err.log

