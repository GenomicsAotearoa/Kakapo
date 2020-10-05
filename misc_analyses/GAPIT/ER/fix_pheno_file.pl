
open (my $fh, "<../phenos_gapit.csv");

my %samples;

while (<$fh>) {
	my @line = split /\s+/;
#	print $line[0] . "\n";
	$samples{$line[0]} = 1;
}

open (my $fh, "<egg_residuals.tsv");

my %inphenofile;

while (<$fh>) {
	my @line = split /\s+/;
#	print $line[0] . "\n";
	$inphenofile{$line[0]} = 1;
}

foreach my $sample (keys %samples) {
	if ($inphenofile{$sample} != 1) {
		print $sample . "\t" . "NA\n";
	}
}
