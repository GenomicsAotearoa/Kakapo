use File::Basename;
use strict;

my @files = glob("/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/02_Alignments_to_Reference/results/alignments/*cram");

foreach my $file (@files) {
	my $cmd = `samtools view -H $file | grep RG`;
	chomp($cmd);
	my ($a, $rg, $sm) = split(/\t/, $cmd);
	if ($rg =~ /\s/) {
		my $original = $rg;
		my $newrg = $rg;
		$newrg =~ s/\s/_/g;
		my $newsm = $sm;
		$newsm =~ s/\s/_/g;
		print $rg . "\t" . $newrg . "\t" . "\n";
		my ($name, $path, $suffix) = fileparse($file, [".cram"]);

		# Remove previous rg
		my $cmd = "samtools view -h $file | grep -v \"$rg\" | samtools addreplacerg -r \"$newrg\" -r \"$newsm\" -O cram -o /scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/02_Alignments_to_Reference/renamed/" . $name . " -";
		system($cmd);
	} else {
                my ($name, $path, $suffix) = fileparse($file, [".cram"]);
		system("cp -s $file /scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/02_Alignments_to_Reference/renamed/$name");
	}
}
