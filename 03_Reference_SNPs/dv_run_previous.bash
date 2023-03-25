BIN_VERSION="0.8.0"

INPUT_DIR="${PWD}/alignments"

OUTPUT_DIR="${PWD}/dv-output"
mkdir -p "${OUTPUT_DIR}"

sudo docker run \
  -v "${INPUT_DIR}":"/input" \
  -v "${OUTPUT_DIR}:/output" \
  gcr.io/deepvariant-docker/deepvariant_gpu:"${BIN_VERSION}" \
  /opt/deepvariant/bin/run_deepvariant \
  --model_type=WGS \
  --ref=assembly.fasta \
  --reads=/input/all.bam \
  --output_vcf=/output/output.vcf.gz \
  --output_gvcf=/output/output.g.vcf.gz




