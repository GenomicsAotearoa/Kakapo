#!/usr/bin/env perl
use strict;

my $Gstart = 0;
my $Glandmark = "starting";
my $last_good = 0;
my $Gend = 0;

while (<STDIN>) {
    chomp;
    my ($landmark, $base, $cov) = split(/\t/);

    $Glandmark = $landmark if $Glandmark eq "starting";
    
    if ($Glandmark ne $landmark) {
      print join("\t", $Glandmark, $Gstart, $Gend) unless $Gstart == 0 || $Gend == 0 || ($Gend - $Gstart) < 500;
      print "\n" unless $Gstart == 0 || $Gend == 0 || ($Gend - $Gstart) < 500;
      $Glandmark = $landmark;
      $Gstart = 0;
    }

    if ($cov >= 15 && $cov <= 1000) {
      if ($Gstart == 0) {
	$Gstart = $base;
        $last_good = $base;
	next;
      }

      if ($base - $last_good == 1) {
	$last_good = $base;
        $Gend = $base;
	next;
      }
    }

    if ($cov < 15 || $cov >= 1000) {
      print join("\t", $Glandmark, $Gstart, $Gend) unless $Gstart == 0 || $Gend == 0 || ($Gend - $Gstart) < 500;
      print "\n" unless $Gstart == 0 || $Gend == 0 || ($Gend - $Gstart) < 500;
      $Gstart = 0;
      $Gend = 0;
      $last_good = 0;
    }
}

