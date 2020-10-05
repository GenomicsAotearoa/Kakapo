#!/usr/bin/perl
#
#	script to convert the GTF and GFF files for the kakapo genomes
#	to a more useful name for work with existing variant files
#
#   code inspired by: 
#
#	created by: 	github.com/pjbiggs on 2020-08-26
#	last edited by: github.com/pjbiggs on 2020-08-27
#
#####################################################

use strict;
use warnings;

die "Usage: $0 hash_file gff_file\n" if @ARGV < 2;

my ($hashfile, $gfffile, $gffMod) = @ARGV;

open(my $hfile, '<', $hashfile) or die "Cannot open $hashfile: $!";
my %names;
while (my $line = <$hfile>) {
    chomp($line);
    my ($oldname, $newname) = split /\t/, $line;
    $names{$oldname} = $newname;
}
close $hfile;

my $regex = join '|', sort { length $b <=> length $a } keys %names;
$regex = qr/$regex/;

open(my $gfile, '<', $gfffile) or die "Cannot open $gfffile: $!";
open(my $out, '>', $gffMod) or die "Cannot open $gffMod: $!";

while (my $line = <$gfile>) {
    chomp($line);
    $line =~ s/($regex)/$names{$1}/g;
    print $out $line, "\n";
}

close $out;
close $gfile;

