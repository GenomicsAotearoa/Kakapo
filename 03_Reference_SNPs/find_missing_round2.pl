# all_regions.txt

my @files = glob("freebayes-regions/*vcf");

my %finished;

for my $file (@files) {
	# freebayes-regions/RXXE01000055.1_0-500000.vcf
	$file =~ /\/(.*)\.vcf/;
	$finished{$1} = true;
}

open (my $fh, "<missing_regions.txt");

open (my $missing, ">missing_regions2.txt");

while (<$fh>) {
	chomp;
	my $id = $_;
	my $orig_id = $_;
	$id =~ s/:/_/g;
	if (!$finished{$id}) {
		print $id . "\n";

		# Missing, so we need to split it up
		$orig_id =~ /(.*:)(\d+)-(\d+)/;
		my $header = $1;
		my $start = $2;
		my $end = $3;
		my $startx = $start;
		my $endx = $start += 1000;
		while ($endx < $end) {
			print $missing $header . "$startx-$endx" . "\n";
			$startx = $endx + 1;
			$endx = $startx + 1000 - 1;
		}
		print $missing $header . "$startx-$end" . "\n";
	}
}
