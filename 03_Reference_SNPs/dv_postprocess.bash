BIN_VERSION="0.8.0"

INPUT_DIR="${PWD}/alignments-nonsym"

OUTPUT_DIR="${PWD}/output"
mkdir -p "${OUTPUT_DIR}"

sudo docker run \
  -v "${INPUT_DIR}":"/input" \
  -v "${OUTPUT_DIR}":"/output" \
  -v "${PWD}/ref":"/ref" \
  gcr.io/deepvariant-docker/deepvariant:"${BIN_VERSION}" \
  /opt/deepvariant/bin/postprocess_variants \
  --ref=/ref/assembly.fasta \
  --infile /output/Adelaide.called \
  --outfile /output/Adelaide.vcf
