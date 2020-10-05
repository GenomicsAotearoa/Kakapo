#!/usr/bin/env perl
use strict;
use List::Util qw/shuffle/;

# guhjo98p@mahuika02 /n/n/u/K/m/random_plumage_pheno_gwas> cut -f 2 pheno_plumage.tsv | grep 0 | wc -l                                                                                                                                          (py2)
# 74
# guhjo98p@mahuika02 /n/n/u/K/m/random_plumage_pheno_gwas> cut -f 2 pheno_plumage.tsv | grep 1 | wc -l  
# 91

open (my $out, ">pheno_file.txt");

my $header1 = "<Phenotype>";
my $header2 = "\ntaxa\tdata";

my @sample_ids;

open(my $sample_fh, "</scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/misc_analyses/random_plumage_pheno_gwas/sample_ids.tsv");

while (<$sample_fh>) {
	chomp;
	push(@sample_ids, $_);
}

my @phenos;
push @phenos, 0 foreach (1..74);
push @phenos, 1 foreach (1..91);

my @phenos = shuffle(@phenos);

print $out $header1;
print $out $header2;

foreach my $i (0..scalar(@phenos)-1) {
	print $out "\n" . $sample_ids[$i] . "\t" . $phenos[$i];
}
