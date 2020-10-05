my @snp_ids;
open (my $fh, "<NW_022045595.1_ctg1.snps");
while (<$fh>) {
	chomp;
	push(@snp_ids, $_);
}

open (my $fh, "<all_snps_s13.shuf");

my $cmd = "../../software/plink --chr-set 89 --bfile plink --ld ";
my $cmd_2 = "| grep \"R-sq\"";

my $highest = 0.0;
my $highest_snp = '';

while (<$fh>) {
	chomp;
	next if ($_ =~ /NW_022045595/);
	foreach my $snp (@snp_ids) {
		my $cmd_to_exec = $cmd . "\"" . $snp . "\" \"" . $_ . "\" " . $cmd_2;
		my $output = `$cmd_to_exec`;
		$output =~ /R-sq = (\d\.\d+)\s/;
		print $snp . "\t" . $_ . "\t" . $1 . "\n";
	}
}

# ../../software/plink --bfile plink --ld NW_022045595.1_ctg1_47110_G_A S1_378262_C_T --chr-set 89 | grep "R-sq"

