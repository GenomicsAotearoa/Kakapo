use strict;
open (my $fh, "<error_attr_correct_gt.txt");

my %init;

while(<$fh>) {
	chomp;
	my ($location, $sample, $alleles) = split /\s+/;
	my ($chr, $pos) = split(/:/, $location);

	unless ($init{$sample}) {
		system("cp header.vcf mendelian_inheritance_snps/$sample.vcf");
	}

	open (my $out, ">>mendelian_inheritance_snps/" . $sample . ".vcf");

	unless ($init{$sample}) {
		print $out "#CHROM\tPOS\tID\tREF\tALT\tQUAL\tFILTER\tINFO\tFORMAT\t$sample\n";
		$init{$sample} = 1;
	}

	my $ref_allele_data = `bcftools view ../dv-first-round-run/vcfs/$sample.vcf.gz -H -r $chr:$pos`;
	my $ref_allele;
	my $line_count = $ref_allele_data =~ tr/\n//;
	next if ($line_count > 1);

	chomp($ref_allele_data);
	my ($a, $b, $c, $ref, $alt, $score, $filter, $info, $format, $definition) = split(/\t/, $ref_allele_data);
	$ref_allele = uc($ref);

        my @alleles = split(/\//, $alleles);
	my $alt_allele = uc($alt);

	my @gt;
	foreach my $allele (@alleles) {
#		print $allele . "\n";
		push(@gt, "0") if ($allele eq $ref_allele);
		push(@gt, "1") if ($allele eq $alt_allele);
	}
# 	print "\n\n";

	my $gt = join("/", @gt);
        next if $gt eq "0/0"; # Can't work with hom-ref
	$gt = "0/1" if $gt eq "1/0";

        my @data = ($chr, $pos, ".", $ref_allele, $alt_allele, "15", "PASS", ".", "GT", $gt);

	print $out join("\t", @data);
	print $out "\n";
}

