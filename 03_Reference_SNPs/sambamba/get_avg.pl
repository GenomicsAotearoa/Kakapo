use strict;

my $file = $ARGV[0];

open (my $fh, "zcat $file |") or die "gunzip $file: $!";

my $target = 1000000;

my $landmark_current = "";
my $region_start = 0;

my $region_average_depth = 0;
my $region_total_avg_depth = 0;
my $region_total_length = 0;

while (<$fh>) {
  chomp;
  my ($landmark, $start, $end, $count) = split /\t/;

  if ($landmark ne $landmark_current) {
    # process landmark or we are at the start
    if ($landmark_current eq "") {
      $landmark_current = $landmark;
    } else {
      # Process landmark
      # .............
    }
  } else {
    # Same landmark

    $region_total_length += $end - $start;
    $region_total_avg_depth += $count;

    if ($region_total_length >= $target) {
      # Process region
      print join("\t", $landmark, $region_start, $end, $region_total_avg_depth, "\n");
      $region_total_avg_depth = 0;
      $region_total_length = 0;
      $region_start = $end;
    }


  }







}
