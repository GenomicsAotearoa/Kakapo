BIN_VERSION="0.8.0"

INPUT_DIR="${PWD}/alignments-nonsym"

OUTPUT_DIR="${PWD}/output"
mkdir -p "${OUTPUT_DIR}"

sudo docker run \
  -v "${INPUT_DIR}":"/input" \
  -v "${OUTPUT_DIR}":"/output" \
  -v "${PWD}/ref":"/ref" \
  gcr.io/deepvariant-docker/deepvariant:"${BIN_VERSION}" \
  /opt/deepvariant/bin/run_deepvariant \
  --use_ref_for_cram=true \
  --model_type=WGS \
  --ref=/ref/assembly.fasta \
  --reads=/input/Adelaide.cram \
  --regions "CM013761.1:1-100000" \
  --output_vcf=/output/output.vcf.gz \
  --output_gvcf=/output/output.g.vcf.gz
