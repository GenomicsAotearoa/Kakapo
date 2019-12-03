#!/bin/bash
#SBATCH -D /scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/03_Reference_SNPs/DeepVariantTraining
#SBATCH -J DVT_Shuffle
#SBATCH -o /scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/03_Reference_SNPs/DeepVariantTraining/7.log
#SBATCH --no-requeue
#SBATCH -c 8
#SBATCH -t 18:00:00
#SBATCH --mem 83968M
#SBATCH -p ga_bigmem,bigmem,hugemem,ga_hugemem
#SBATCH -A uoo02695

conda activate

# Must install apache beam, python-snappy suggested
python ./bin/shuffle_tfrecords_beam.py \
	--input_pattern_list="./training_examples/?????.with_labels.examples" \
	--output_pattern_prefix="./training_examples_shuffled/shuffled" \
	--output_dataset_name="KakapoPop" \
	--runner=DirectRunner
