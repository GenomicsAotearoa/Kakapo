# all_regions.txt

my @files = glob("freebayes-regions/*vcf");

my %finished;

for my $file (@files) {
	# freebayes-regions/RXXE01000055.1_0-500000.vcf
	$file =~ /\/(.*)\.vcf/;
	$finished{$1} = true;
}

open (my $fh, "<all_regions.txt");

open (my $missing, ">missing_regions.txt");

while (<$fh>) {
	chomp;
	my $id = $_;
	my $orig_id = $_;
	$id =~ s/:/_/g;
	if (!$finished{$id}) {
		print $id . "\n";
		print $missing $orig_id . "\n";
	}
}
