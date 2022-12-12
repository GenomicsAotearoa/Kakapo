open (my $fh, "<egg_shape_ratio_0centered_noheader.tsv");

my @a;

while(<$fh>) {
  push(@a, $_);
}

open (my $fh, "<plink2.fam");

my $i = 0;

while(<$fh>) {
	chomp;
	my @line = split /\s+/;
	$line[-1] = $a[$i];
	print(join(" ", @line));
	$i++;
		
}
