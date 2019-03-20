use strict;

# This is the least efficient way to do this, but it's fast enough....

open (my $fh, "<$ARGV[0]");

my %ids;

while (<$fh>) {
  chomp;
  my ($id, $name) = split /\t/;

  if (index($ARGV[1], $id) != -1) {
    print $name . "\n";
  }
}
