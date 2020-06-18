Channel
  .fromFilePairs("/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/03_Reference_SNPs/alignments.original_reference/*.{cram,cram.crai}", flat: true)
  .into { alignments0; alignments70; alignments85; alignments30; alignments40 }

//reference = file("/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/03_Reference_SNPs/ref/assembly.fasta")
// reference_idx = file("/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/03_Reference_SNPs/ref/assembly.fasta.fai")
//reference_path = file("/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/03_Reference_SNPs/ref/")
reference = file("/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/03_Reference_SNPs/DeepVariantTraining/test/assembly.fasta")
reference_idx = file("/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/03_Reference_SNPs/DeepVariantTraining/test/assembly.fasta.fai")
reference_path = file("/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/03_Reference_SNPs/DeepVariantTraining/test/")
shards = 18;
shards_minus_one = shards - 1;

/*

Minimum read depth of 15 for confident regions...
so 0% drop rate is read depth of 15 (min)
70% of reads kept is depth of 10.5 simulated
60% is 9
30% is 4.5
35% is 5.25
40% is 6

.....
so let's do
0 -- 15 read depth minimum
30% -- 4.5 read depth average (minimum, not average)
and 40% -- 6 read depth average (minimum)
and 70% -- ~10.5 read minimum


*/

process makeExamplesDs0 {
  tag { "${accession}" }
  storeDir "./examples_full"
  container '/scale_wlg_nobackup/filesets/nobackup/uoo02695/variant-utils_deepvariant_0.9.0.sif'
  cache true
  cpus 18
  queue 'prepost,large,ga_bigmem,bigmem,hugemem,ga_hugemem'
  memory { 22.GB + (task.attempt * 4.GB) }
  time { (task.attempt * 12.hour) }
  errorStrategy 'retry'
  maxRetries 10
  module 'Singularity'
  module 'Parallel'
  publishDir "./training_examples_full", mode: 'move'

  input:
    set accession, cram, crai from alignments0
    reference_path

  output:
    set accession, cram, crai, file("${accession}.*.with_labels*.examples")

  """
  ls ${reference_path}

  time seq 0 ${shards_minus_one} | \
  parallel --jobs 12 --eta --halt 2 \
  /opt/deepvariant/bin/make_examples \
      --mode=training \
      --use_ref_for_cram=true \
      --ref=${reference} \
      --examples ${accession}.ds0.with_labels@${shards}.examples \
      --sample_name ${accession} \
      --reads ${cram} \
      --truth_variants=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/03_Reference_SNPs/DeepVariantTraining/final_vcfs/${accession}.vcf.gz \
      --confident_regions=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/03_Reference_SNPs/DeepVariantTraining/training_data/${accession}.bed \
      --write_run_info \
      --task {}
  """
}

process makeExamplesDs30 {
  tag { "${accession}" }
  storeDir "./examples_full"
  container '/scale_wlg_nobackup/filesets/nobackup/uoo02695/variant-utils_deepvariant_0.9.0.sif'
  cache true
  cpus 18
  queue 'prepost,large,ga_bigmem,bigmem,hugemem,ga_hugemem'
  memory { 22.GB + (task.attempt * 4.GB) }
  time { (task.attempt * 12.hour) }
  errorStrategy 'retry'
  maxRetries 10
  module 'Singularity'
  module 'Parallel'
  publishDir "./training_examples_full", mode: 'move'

  input:
    set accession, cram, crai from alignments30
    reference_path

  output:
    set accession, cram, crai, file("${accession}.*.with_labels*.examples")

  """
  time seq 0 ${shards_minus_one} | \
  parallel --jobs 12 --eta --halt 2 \
  /opt/deepvariant/bin/make_examples \
      --mode=training \
      --use_ref_for_cram=true \
      --ref=${reference} \
      --examples ${accession}.ds30.with_labels@${shards}.examples \
      --sample_name ${accession} \
      --reads ${cram} \
      --truth_variants=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/03_Reference_SNPs/DeepVariantTraining/final_vcfs/${accession}.vcf.gz \
      --confident_regions=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/03_Reference_SNPs/DeepVariantTraining/training_data/${accession}.bed \
      --write_run_info \
      --downsample_fraction=0.30 \
      --task {}
  """
}

process makeExamplesDs70 {
  tag { "${accession}" }
  storeDir "./examples_full"
  container '/scale_wlg_nobackup/filesets/nobackup/uoo02695/variant-utils_deepvariant_0.9.0.sif'
  cache true
  cpus 18
  queue 'prepost,large,ga_bigmem,bigmem,hugemem,ga_hugemem'
  memory { 22.GB + (task.attempt * 4.GB) }
  time { (task.attempt * 12.hour) }
  errorStrategy 'retry'
  maxRetries 10
  module 'Singularity'
  publishDir "./training_examples_full", mode: 'move'

  input:
    set accession, cram, crai from alignments70
    reference_path

  output:
    set accession, cram, crai, file("${accession}.*.with_labels*.examples")

  """
  time seq 0 ${shards_minus_one} | \
  parallel --eta --jobs 12 --halt 2 \
  /opt/deepvariant/bin/make_examples \
      --mode=training \
      --use_ref_for_cram=true \
      --ref=${reference} \
      --examples ${accession}.ds60.with_labels@${shards}.examples \
      --sample_name ${accession} \
      --reads ${cram} \
      --truth_variants=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/03_Reference_SNPs/DeepVariantTraining/final_vcfs/${accession}.vcf.gz \
      --confident_regions=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/03_Reference_SNPs/DeepVariantTraining/training_data/${accession}.bed \
      --write_run_info \
      --downsample_fraction=0.60 \
      --task {}
  """
}


process makeExamplesDs40 {
  tag { "${accession}" }
  storeDir "./examples_full"
  container '/scale_wlg_nobackup/filesets/nobackup/uoo02695/variant-utils_deepvariant_0.9.0.sif'
  cache true
  cpus 18
  queue 'prepost,large,ga_bigmem,bigmem,hugemem,ga_hugemem'
  memory { 22.GB + (task.attempt * 4.GB) }
  time { (task.attempt * 12.hour) }
  errorStrategy 'retry'
  maxRetries 10
  module 'Singularity'
  publishDir "./training_examples_full", mode: 'move'

  input:
    set accession, cram, crai from alignments40
    reference_path

  output:
    set accession, cram, crai, file("${accession}.*.with_labels*.examples")

  """
  time seq 0 ${shards_minus_one} | \
  parallel --eta --jobs 12 --halt 2 \
  /opt/deepvariant/bin/make_examples \
      --mode=training \
      --use_ref_for_cram=true \
      --ref=${reference} \
      --examples ${accession}.ds40.with_labels@${shards}.examples \
      --sample_name ${accession} \
      --reads ${cram} \
      --truth_variants=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/03_Reference_SNPs/DeepVariantTraining/final_vcfs/${accession}.vcf.gz \
      --confident_regions=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/03_Reference_SNPs/DeepVariantTraining/training_data/${accession}.bed \
      --write_run_info \
      --downsample_fraction=0.40 \
      --task {}
  """
}
