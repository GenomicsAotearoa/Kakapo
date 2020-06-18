
  singularity exec ../../../../variant-utils_deepvariant_0.9.0.sif \
  /opt/deepvariant/bin/call_variants \
    --examples Adelaide.CM013766.1.examples \
    --outfile "Adelaide.CM013766.1.called" \
    --checkpoint ./model.ckpt-337577
