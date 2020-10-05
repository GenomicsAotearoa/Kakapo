# batch1_p1.0_e0.0_pf0.25_n2_tassel_pheno.txt   batch1_p1.0_e0.0_pf0.25_n7_tassel_pheno.txt
# batch1_p1.0_e0.0_pf0.25_n2_testsnp.vcf        batch1_p1.0_e0.0_pf0.25_n7_testsnp.vcf
# batch1_p1.0_e0.0_pf0.25_n30_plink_pheno.txt   batch1_p1.0_e0.0_pf0.25_n8_plink_pheno.txt
# batch1_p1.0_e0.0_pf0.25_n30_tassel_pheno.txt  batch1_p1.0_e0.0_pf0.25_n8_tassel_pheno.txt
# batch1_p1.0_e0.0_pf0.25_n30_testsnp.vcf       batch1_p1.0_e0.0_pf0.25_n8_testsnp.vcf
# batch1_p1.0_e0.0_pf0.25_n31_plink_pheno.txt   batch1_p1.0_e0.0_pf0.25_n9_plink_pheno.txt
# batch1_p1.0_e0.0_pf0.25_n31_tassel_pheno.txt  batch1_p1.0_e0.0_pf0.25_n9_tassel_pheno.txt
# batch1_p1.0_e0.0_pf0.25_n31_testsnp.vcf       batch1_p1.0_e0.0_pf0.25_n9_testsnp.vcf

my $half1 = $ARGV[0];
my $half2 = $ARGV[1];
my $k = $ARGV[2];
my $pyscript_t = $ARGV[3];
my $pyscript_p = $ARGV[4];
my $cov = $ARGV[5];
my $plinkfam = $ARGV[6];
my $pyscript_f = $ARGV[7];

my $nl = "\n";

my @tassel_phenos = glob("*tassel_pheno.txt");
foreach my $pheno (@tassel_phenos) {
	$pheno =~ /(batch.*)_tassel_pheno.txt/;
	my $id = $1;
	# batch1_p1.0_e0.0_pf0.25_n9_testsnp.vcf
	print "cat $half1 " . $id . "_testsnp.vcf $half2 > totest.vcf\n";
	# print $id . "\n";

	$id =~ /(batch.*)_n\d+/;
	my $runid = $1;

#	print "/scale_wlg_nobackup/filesets/nobackup/uoo02695/software/TASSEL5/run_pipeline.pl \\" . $nl;
#	print "\t-Xms16g -Xmx32g \\" . $nl;
#	print "\t-fork1 -vcf totest.vcf \\" . $nl;
#	print "\t-fork2 -r $pheno \\" . $nl;
#	print "\t-combine3 \\" . $nl;
#	print "\t-input1 -input2 -intersect \\" . $nl;
#	print "\t-fork4 -k " . $k . " \\" . $nl;
#	print "\t-combine5 -input3 -input4 \\" . $nl;
#	print "\t-mlm  \\" . $nl;
#	#print "\t-mlmMaxP 0.2 \\" . $nl;
#	print "\t-mlmOutputFile test" . $nl;
#	print "python $pyscript_t >> $runid.tassel.stats\n";

	print "\n\n";

	print "plink2 --vcf totest.vcf --make-bed --allow-extra-chr --chr-set 89 --vcf-half-call missing --max-alleles 2\n";
	# print "${id}_plink_pheno.txt\n";
	print "cp ${plinkfam} plink2.fam\n";
	print "plink2 --bfile plink2 --allow-extra-chr --allow-no-sex \\\n";
	print "\t--ci 0.95 --chr-set 89 --covar $cov --glm firth \\\n";
	print "\t--no-psam-pheno --out test \\\n";
	print "\t--vif 10000 --max-corr 1\\\n";
	print "\t--pheno ${id}_plink_pheno.txt --threads 10\n";
	print "python ${pyscript_f} >> $runid.plink.firth.stats\n";

        print "plink2 --bfile plink2 --allow-extra-chr --allow-no-sex \\\n";
        print "\t--ci 0.95 --chr-set 89 --covar $cov --glm \\\n";
        print "\t--no-psam-pheno --out test \\\n";
        print "\t--vif 10000 --max-corr 1\\\n";
        print "\t--pheno ${id}_plink_pheno.txt --threads 10\n";
        print "python ${pyscript_p} >> $runid.plink.stats\n";

	print "\n\n";
	print "rm totest.vcf\n";
#	print "rm test_totest*txt\n";
#	print "rm *hybrid\n";
#	print "rm *logistic\n";
#	print "rm *firsth\n";
	print "echo done\n";
	print "\n\n";


	
}

