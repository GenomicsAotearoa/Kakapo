use strict;

# This is the least efficient way to do this, but it's fast enough....

open (my $fh, "<$ARGV[0]");

my %ids;

my $filename = $ARGV[1];

$filename =~ /[LM](00\d)/;
my $lane = $1;

while (<$fh>) {
  chomp;
  my ($id, $name) = split /\t/;

  if (index($filename, $id) != -1) {
    print "export NAME=$name\n";
    print "export LANE=$lane\n";
    exit;
  }
}
