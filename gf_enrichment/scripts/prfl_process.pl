use strict;
use List::Util qw[min max];
use File::Basename;

my $results = $ARGV[0];
my $prfl = $ARGV[1];
my $configdir = $ARGV[2];
my $fasta = $ARGV[3];
my $outputfile = $ARGV[4];
# my $hints = $ARGV[5];

my @coords;

open(my $fh, "<$results");
  <$fh>;
  while (<$fh>) {
    chomp;
    next if ($_ =~ /Score/);
    next if ($_ =~ /Mult/);
    if ($_ =~ /\d+.*/) {
      my @line = split /\s+/;
      push(@coords, $line[0]);
    }

    if ($_ eq '--') {
      my $min = min(@coords) - 1500; # Previously 1kbp, now 1.5kbp
      my $max = max(@coords) + 1500;
      # Removed for now... --hintsfile=$hints
      my $cmd = "/Volumes/archive/deardenlab/guhlin/software/augustus-3.3.2/bin/augustus --UTR=off --genemodel=complete --optCfgFile=$configdir/ppx.cfg --predictionStart=$min " .
        "--predictionEnd=$max --proteinprofile=$prfl --extrinsicCfgFile=$configdir/extrinsic.E.XNT.cfg --uniqueGeneId=true $fasta > $outputfile";
      print $cmd . "\n";
      system($cmd);
      @coords = ();
      next;
    }
  }
