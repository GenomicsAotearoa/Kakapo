my @snp_ids;
open (my $fh, "<NW_022045595.1_ctg1.snp_ids");
while (<$fh>) {
	chomp;
	push(@snp_ids, $_);
}

open (my $fh, "<all_snp_ids.shuf");

my $cmd = "../../software/plink --chr-set 89 --bfile plink --ld ";
my $cmd_2 = "| grep \"R-sq\"";

sub mean {
    return sum(@_)/@_;
}

my $highest = 0.0;
my $highest_snp = '';

while (<$fh>) {
	chomp;
	next if ($_ =~ /NC_044299/);
	my @r2s;
	foreach my $snp (@snp_ids) {
		my $cmd_to_exec = $cmd . "\"" . $snp . "\" \"" . $_ . "\" " . $cmd_2;
		my $output = `$cmd_to_exec`;
		$output =~ /R-sq = (\d\.\d+)\s/;
		push(@r2s, $1);
		print join("\t", $snp, $_, $1);
		print "\n";
	}
	my $r2mean = mean(@r2s);
	if ($r2mean > $highest) {
		$highest_snp = $_;
		$highest = $r2mean;
		print "New record!\t" . $highest_snp . "\t" . $highest . "\n";
	}
	

	

}


# ../../software/plink --bfile plink --ld NW_022045595.1_ctg1_47110_G_A S1_378262_C_T --chr-set 89 | grep "R-sq"




