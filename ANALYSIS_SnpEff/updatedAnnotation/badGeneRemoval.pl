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

my ($resultF);

GetOptions ('resultF:s'     => \$resultF);

my $root	= ("/home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/");
my $log		= ($root . "logBadNotesNotes.txt");
my $list	= ($root . "unique_warning_genesExtra.list");
my $script	= ($root . "runningGenes.sh");
my $resF	= ($root . $resultF . "/");

my @file	= ("gff", "gtf");

my ($curFile, $curGene, $file1, $file2, $thing);

open (LOG, ">$log") or die ("couldn't open $log: $!\n");

print ("Process started at " . scalar(localtime) . ".\n");
print LOG ("Process started at " . scalar(localtime) . ".\n");


## make the results folder ##

if (-e $resF) {	print ("$resF already exists.\n");
} else {			   system "mkdir $resF";
}


## make and sort the array ##

my @genes	= ();

open (IN, "<$list") or die ("couldn't open $list: $!\n");

while (<IN>) {
	chomp;
	my $line	= $_;
	push(@genes, $line);
}

close IN;

@genes		= sort(@genes);
my $size	= @genes;

print ("Our list of $size bad genes is:\n");
print (join("\t", @genes), "\n");
print ("List sorted at " . scalar(localtime) . ".\n\n");
print LOG ("Our list of $size bad genes is:\n");
print LOG (join("\t", @genes), "\n");
print LOG ("List sorted at " . scalar(localtime) . ".\n\n");


## do the work ##

open (OUT, ">$script") or die ("couldn't open $script: $!\n");	

print OUT ("#!/bin/bash\n\n");	


foreach $curFile(@file) {
	
	my $annoFile	= ($root . "Mod_GCF_004027225.2_bStrHab1.2.pri_genomic." . $curFile);
	my $annoFile2	= ($resF . "Clean_GCF_004027225.2_bStrHab1.2.pri_genomic." . $curFile);
	my $tempAnno	= ($root . "tempData." . $curFile);
#	my $totalPre	= ($root . "countsForPre_" . $curFile . ".txt");
#	my $totalPost	= ($root . "countsForPost_" . $curFile . ".txt");
#	my $removed		= ($root . "allRemovedFrom_" . $curFile . ".txt");

	foreach $curGene(@genes) {
		my $preGeneCount	= ($root . "preCountsFor_" . $curGene . "." . $curFile);
		my $postGeneCount	= ($root . "postCountsFor_" . $curGene . "." . $curFile);
		
		if ($curFile eq "gff") {		$thing	= ("gene=$curGene\;");
		} elsif ($curFile eq "gtf") {	$thing	= ("gene \"$curGene\"");
		}

		print ("As it is a $curFile file, we are grepping precisely --||$thing||--.\n");
		
		if ($curGene eq $genes[0]) {				$file1	= $annoFile;	$file2	= $tempAnno;
		} elsif ($curGene eq $genes[$size - 1]) {	$file1	= $tempAnno;	$file2	= $annoFile2;
		} else {									$file1	= $tempAnno;	$file2	= $tempAnno;
		}

		if ($curFile eq "gff") {
			print OUT ("grep \"gene=$curGene\;\" $file1 > $preGeneCount\n");	
			print OUT ("grep -v \"gene=$curGene\;\" $file1 > temp && mv temp $file2\n");				
			print OUT ("grep \"gene=$curGene\;\" $file2 > $postGeneCount\n\n");				
		} elsif ($curFile eq "gtf") {	
			print OUT ("sed -n \'\/gene \"$curGene\"\/ p\' $file1 > $preGeneCount\n");	
			print OUT ("sed -n \'\/gene \"$curGene\"\/ !p\' $file1 > temp && mv temp $file2\n");	
			print OUT ("sed -n \'\/gene \"$curGene\"\/ p\' $file2 > $postGeneCount\n\n");	
		}

		print ("\t--Processing for $curGene complete at " . scalar(localtime) . ".\n\n");
		print LOG ("\t--Processing for $curGene complete at " . scalar(localtime) . ".\n");		
	}
	
	print ("\tProcess complete on the $curFile file at " . scalar(localtime) . ".\n\n");
	print LOG ("\tProcess complete on the $curFile file at " . scalar(localtime) . ".\n\n");
}


## clean up ##

foreach $curFile(@file) {
	
	my $totalPre	= ($resF . "countsForPre_" . $curFile . "_Ex.txt");
	my $totalPost	= ($resF . "countsForPost_" . $curFile . "_Ex.txt");
	my $removed		= ($resF . "allRemovedFrom_" . $curFile . "_Ex.txt");
	my $preRemove	= ("preCount*" . $curFile);
	my $postRemove	= ("postCount*" . $curFile);	
	
	if (-e $removed) {	system "rm $removed";
	}	
	
	print OUT ("cat $preRemove > $removed\n");
	print OUT ("wc $preRemove > $totalPre\n");
	print OUT ("wc $postRemove > $totalPost\n");
	print OUT ("rm $preRemove\n");
	print OUT ("rm $postRemove\n");	
}

close OUT;

print ("Now running the bash script at " . scalar(localtime) . ".\n\n");
print LOG ("Now running the bash script at " . scalar(localtime) . ".\n\n");

system "sh $script";

print ("Process finished at " . scalar(localtime) . ".\n");
print LOG ("Process finished at " . scalar(localtime) . ".\n");

close LOG;
