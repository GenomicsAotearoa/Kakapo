open (my $fh, "<error_attr_correct_gt.txt");

my %chrs;

while (<$fh>) {
	my @a = split / /;
	my @b = split(/:/, $a[0]);
	$chrs{$b[0]}++;
}

foreach my $chr (sort { $chrs{$b} <=> $chrs{$a} } keys %chrs) {
	print $chr . "\t" . $chrs{$chr} . "\n";


}
