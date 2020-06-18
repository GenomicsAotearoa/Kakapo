# cp -L alignments/Mahli.cram* input/

singularity exec \
	-B input/:/input \
	-B output/:/output \
	-B ref/:/ref \
	/scale_wlg_nobackup/filesets/nobackup/uoo02695/deepvariant_0.8.0.sif \
	/opt/deepvariant/bin/make_examples \
	--mode=calling \
	--hts_block_size=536870912 \
	--use_ref_for_cram=true \
	--ref=/ref/assembly.fasta \
	--examples /output/Mahli \
	--reads /input/Mahli.cram
