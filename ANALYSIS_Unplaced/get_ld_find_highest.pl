
open (my $fh, "<all_snp_ids.shuf");

my $cmd = "../../software/plink --chr-set 89 --bfile plink --ld NW_022045595.1_ctg1_47110_G_A ";
my $cmd_2 = "| grep \"R-sq\"";

my $highest = 0.0;
my $highest_snp = '';

while (<$fh>) {
	chomp;
	next if ($_ =~ /NW_022045595/);
	my $cmd_to_exec = $cmd . " " . $_ . " " . $cmd_2;
	my $output = `$cmd_to_exec`;
	$output =~ /R-sq = (\d\.\d+)\s/;
	if ($1 > $highest) {
		print "New record!\n";
		$highest = $1;
		$highest_snp = $_;
		print $highest . " " . $highest_snp . "\n";
	}
}

# ../../software/plink --bfile plink --ld NW_022045595.1_ctg1_47110_G_A S1_378262_C_T --chr-set 89 | grep "R-sq"

