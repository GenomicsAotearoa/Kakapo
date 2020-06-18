#!/usr/bin/env perl
use strict;

# CHROM  POS     ID      REF     ALT     QUAL    FILTER  INFO    FORMAT  Adelaide
# CM013761.1      1713    .       TA      T       9.6     PASS    .       GT:GQ:DP:AD:VAF:PL      1/1:3:6:4,2:0.333333:6,0,0


my $file = $ARGV[0];
open (my $fh, "<$file");

open (my $header, "</scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/03_Reference_SNPs/DeepVariantTraining/header_full.vcf");

while (<$header>) {
	print $_;
}

my $sample = $ARGV[1];

print "#CHROM\tPOS\tID\tREF\tALT\tQUAL\tFILTER\tINFO\tFORMAT\t$sample\n";

while (<$fh>) {
    next if substr($_, 0, 1) eq '#';
    chomp;
    my @data = split /\t/;
    next unless $data[6] eq 'PASS';
    my ($landmark, $post, $id, $ref, $alt, $qual, $filter, $info, $format, $results) = @data;
    my @results = split(/:/, $results);
    my ($gt, $gq, $dp, $ad, $vaf, $pl) = @results;

    # next if $gq < 15;
    # next if $dp < 5;

    print $_ . "\n";
}

