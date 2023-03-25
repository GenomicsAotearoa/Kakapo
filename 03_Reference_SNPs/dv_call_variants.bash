BIN_VERSION="0.8.0"

INPUT_DIR="${PWD}/alignments-nonsym"

OUTPUT_DIR="${PWD}/output"
mkdir -p "${OUTPUT_DIR}"

sudo docker run \
  -v "${INPUT_DIR}":"/input" \
  -v "${OUTPUT_DIR}":"/output" \
  -v "${PWD}/ref":"/ref" \
  gcr.io/deepvariant-docker/deepvariant:"${BIN_VERSION}" \
  /opt/deepvariant/bin/call_variants \
  --examples /output/Adelaide \
  --outfile /output/Adelaide.called \
  --checkpoint=/opt/models/wgs/model.ckpt \
  --num_mappers 12 \
  --num_readers 4 \
  --batch_size 128
