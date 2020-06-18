use strict;

my @files = glob("training_data/*.bed");

foreach my $file (@files) {
	my $sample_name = `basename -s .bed $file`;
	chomp($sample_name);
	if (-e "merged_training_vcfs/merged/$sample_name.vcf.gz") {
		system("cp merged_training_vcfs/merged/$sample_name.vcf.gz ./final_vcfs/");
	} else {
		system("cp training_data/confident/$sample_name.vcf ./final_vcfs/");
                # system("cp training_data/confident/$sample_name.vcf.gz ./final_vcfs/");
		# system("gunzip $sample_name.vcf.gz");
		system("bcftools view --min-ac=1 ./final_vcfs/$sample_name.vcf > ./final_vcfs/$sample_name.remove_hom_ref.vcf");
		system("mv ./final_vcfs/$sample_name.remove_hom_ref.vcf ./final_vcfs/$sample_name.vcf");
		system("bgzip -f ./final_vcfs/$sample_name.vcf");
	}
}
