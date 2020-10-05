#!/usr/bin/perl
#
#	script to convert the GTF and GFF files for the kakapo genomes
#	to a more useful name for work with existing variant files
#
#	created by: 	github.com/pjbiggs on 2020-08-26
#	last edited by: github.com/pjbiggs on 2020-08-27
#
#####################################################

use warnings;
use strict;
use Getopt::Long;

my ($randomSet);

GetOptions ('randomSet:s'	=> \$randomSet);

my $root	= ("/home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/");
my $log		= ($root . "logNotes.txt");

my @file	= ("gff", "gtf");
my (@Snames, @Nnames)	= '';

my ($curFile, $count, $chrs, $line, $inFile, $inFile1, $status, $random, $modFile, $key, $val);

my $NC2S	= ($root . "Kakapo_NC_to_S_mapping.txt");
my $S2NC	= ($root . "Kakapo_S_to_NC_mapping.txt");

open (LOG, ">$log") or die ("couldn't open $log: $!\n");

print ("Process started at " . scalar(localtime) . ".\n");
print LOG ("Process started at " . scalar(localtime) . ".\n");


## make a random subset of each file ##

if ($randomSet eq 'yes') {
	&makeRandom();
}


## make arrays of the lists ##

open (NS, "<$NC2S") or die ("couldn't open $NC2S: $!\n");

while (<NS>) {
	chomp;
	my ($curN, $curS)	= split;
	push(@Nnames, $curN);
	push(@Snames, $curS);
	
#	@Nnames = sort {$b cmp $a} @Nnames;
#	@Snames = sort {$b cmp $a} @Snames;	
}

close NS;


## make a hash of the data ## 

open (FILE, "<$NC2S") or die ("couldn't open $NC2S: $!\n");

my %hash;
while (<FILE>) {
   chomp;
   ($key, $val) = split /\t/;
   $hash{$key} .= exists $hash{$key} ? ",$val" : $val;
}

close FILE;

print ("Hash made of $NC2S made at " . scalar(localtime) . ".\n");
print LOG ("Hash made of $NC2S made at " . scalar(localtime) . ".\n");


## do the work ##

foreach $curFile (@file) {
	
	if ($randomSet eq 'yes') {
		$inFile		= ($root . "random10k." . $curFile);
		$modFile	= ($root . "Mod_random10k." . $curFile);
	} else {
		$inFile		= ($root . "GCF_004027225.2_bStrHab1.2.pri_genomic." . $curFile);
		$modFile	= ($root . "Mod_GCF_004027225.2_bStrHab1.2.pri_genomic." . $curFile);		
	}
		
	my $fileLog		= ($root . "log4_" . $curFile . ".txt");
	
	open (L1, ">$fileLog") or die ("couldn't open $fileLog: $!\n");
	
	print L1 ("This is for $curFile in the 'before' status.\n");

	
	## count the occurrences in the file ##
	
	&countThingN($inFile, 'before');
	&countThingS($inFile, 'before');	

	
	## perform the substition ##
	
	system "~/scripting/testHash.pl $NC2S $inFile $modFile";
	
	print L1 ("\n\nThe chromosome IDs in $inFile have been changed.\n");
	print L1 ("Let us check the counts...\n\n");
	
	
	## count again ##

	print L1 ("\n\nThis is for $curFile in the 'after' status.\n");
	
	&countThingN($modFile, 'after');
	&countThingS($modFile, 'after');

	close L1;		
}


print ("Process finished at " . scalar(localtime) . ".\n");
print LOG ("Process finished at " . scalar(localtime) . ".\n");

close LOG;

#####################
#					#
#	subroutines		#
#					#
#####################


sub countThingN {
	($inFile1, $status)	= @_;
	
	foreach $chrs (@Nnames) {
		$count	= 0;
	
		open (IN, "<$inFile1") or die ("couldn't open $inFile1: $!\n");
	
		while (<IN>) {
			chomp;
			$line		= $_;
			my @data	= split;
		
			if (($data[0] =~ $chrs) && (length($data[0]) == length($chrs))) {	$count++;
			}					
		}	
	
		close IN;
	
		print L1 ("The file $inFile1 has $count occurences of $chrs $status conversion.\n");

		print ("Data complete for $chrs at " . scalar(localtime) . ".\n");		
		print LOG ("Data complete for $chrs at " . scalar(localtime) . ".\n");
	}	
}


sub countThingS {
	($inFile1, $status)	= @_;
	
	foreach $chrs (@Snames) {
		$count	= 0;
	
		open (IN, "<$inFile1") or die ("couldn't open $inFile1: $!\n");
	
		while (<IN>) {
			chomp;
			$line		= $_;			
			my @data	= split;
		
			if (($data[0] =~ $chrs) && (length($data[0]) == length($chrs))) {	$count++;
			}				
		}	
	
		close IN;
	
		print L1 ("and the file $inFile1 has $count occurrences of $chrs $status conversion.\n");
		
		print ("Data complete for $chrs at " . scalar(localtime) . ".\n");		
		print LOG ("Data complete for $chrs at " . scalar(localtime) . ".\n");				
	}	
}


sub makeRandom {
	foreach $curFile (@file) {
		my $inFile	= ($root . "GCF_004027225.2_bStrHab1.2.pri_genomic." . $curFile);
		my $random	= ($root . "random10k." . $curFile);
		
		open (IN, "<$inFile") or die ("couldn't open $inFile: $!\n");
		open (OUT, ">$random") or die ("couldn't open $random: $!\n");
		
		my @lines = <IN>;
		
		for my $c (1 .. 100000) {
			print OUT $lines[int rand @lines];
		}
			
		close IN;
		close OUT;

		print ("\tRandom 10k lines for filetype $curFile made at " . scalar(localtime) . ".\n");	
		print LOG ("\tRandom 10k lines for filetype $curFile made at " . scalar(localtime) . ".\n");
	}	
}