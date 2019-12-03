# Must install apache beam, python-snappy suggested
python ./bin/shuffle_tfrecords_beam.py \
	--input_pattern_list="./training_examples/?????.with_labels.examples" \
	--output_pattern_prefix="./training_examples_shuffled/shuffled" \
	--output_dataset_name="KakapoPop" \
	--runner=DirectRunner
