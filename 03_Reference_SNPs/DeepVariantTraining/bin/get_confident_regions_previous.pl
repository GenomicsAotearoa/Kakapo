#!/usr/bin/env perl
use strict;

# CM013761.1      910     .       C       <*>     0       .       END=910 GT:GQ:MIN_DP:PL 0/0:12:4:0,12,119

my $file = $ARGV[0];
open (my $fh, "<$file");

# Also need to do this for VCF file for truth SNPs

while (<$fh>) {
    next if substr($_, 0, 1) eq '#';
    chomp;
    my @data = split /\t/;
    next if $data[7] eq '.';
    my ($landmark, $start, $a, $b, $c, $d, $e, $end_tag, $format, $results) = @data;
    my @results = split(/:/, $results);
    my ($allele, $gq, $dp, $pl) = @results;
    # Need regions that are confident...
    # next unless $allele eq '0/0';
    next unless $gq > 20;
    next unless $dp > 15;

    $end_tag =~ /END=(\d+)/;
    my $end = $1;

    $start = $start - 1; # Bed format is 0-based

    print $landmark . "\t" . $start . "\t" . $end . "\n";

}

