open(my $fh, "<all_recombination_ncycles_20.txt");

# Skip first line
my $a = <$fh>;

# Expand for viewing...
my $size = 1000;

while(<$fh>) {
    chomp;
    my @line = split /\s/;
    my $start = $line[4] - $size;
    my $end = $line[4] + $size;
    if ($start < 0) {
        $start = 0;
    }

    print($line[2] . "\t" . $start . "\t" . $end . "\n");


}