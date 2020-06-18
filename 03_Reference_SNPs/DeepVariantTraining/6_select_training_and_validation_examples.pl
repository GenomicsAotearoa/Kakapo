# Best way to run this
# perl 6_select_training_and_validation_examples.pl > copy_commands.bash
# Run on a node or split up and run in batches...

# There are 3 sequencing runs
# Formats like: 180207_FD00826632
# and           2317-14-04-01
# and           1983-16-4-1
# First one is different tech
# Second two are same tech, different runs

# First calculate the amounts of each..

use strict;
use List::Util qw/shuffle/;
use POSIX;

open (my $FHIDS, "</scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/02_Alignments_to_Reference/SeqIDs_to_name.tsv");

my $s1_cnt = 0;
my $s2_cnt = 0;
my $s3_cnt = 0;

my (@s1, @s2, @s3);

my %id_mapping;

while (<$FHIDS>) {
    chomp;
    
    my ($id, $name) = split(/\t/);
    $id_mapping{$id} = $name;

    if ($id =~ /^180207/) {
        $s1_cnt++;
        push(@s1, $id);
    } elsif ($id =~ /^2317/) {
        $s2_cnt++;
        push(@s2, $id);
    } elsif ($id =~ /^1983/) {
        $s3_cnt++;
        push(@s3, $id);
    }
}

my $total = $s1_cnt + $s2_cnt + $s3_cnt;

# print ("Counts: $s1_cnt $s2_cnt $s3_cnt $total\n");

@s1 = shuffle(@s1);
@s2 = shuffle(@s2);
@s3 = shuffle(@s3);

my $samples = 8; # Balances out to 8...
my $s1_take = ceil($samples * ($s1_cnt / $total));
my $s2_take = ceil($samples * ($s2_cnt / $total));
my $s3_take = ceil($samples * ($s3_cnt / $total));

# print "Take: $s1_take $s2_take $s3_take\n";

my @data_types = ("ds0", "ds30", "ds40", "ds60");

# print join("\t", @data_types) . "\n";

foreach my $i (0..$s1_take-1) {
    my $data_type = shift(@data_types);

    my $sample = shift(@s1);
    my $name = $id_mapping{$sample};

    my @files = glob("./training_examples_full/$name.*$data_type*examples");
    while (scalar(@files) != 18) {
        $sample = shift(@s1);
        $name = $id_mapping{$sample};
        @files = glob("./training_examples_full/$name.*$data_type*examples");
    }
    
    print "rsync -av ./training_examples_full/$name.*$data_type*examples ./training_examples_selected\n";
    
    push(@data_types, $data_type);
}

foreach my $i (0..$s2_take-1) {
    my $data_type = shift(@data_types);

    my $sample = shift(@s2);
    my $name = $id_mapping{$sample};

    my @files = glob("./training_examples_full/$name.*$data_type*examples");
    while (scalar(@files) != 18) {
        $sample = shift(@s2);
        $name = $id_mapping{$sample};
        @files = glob("./training_examples_full/$name.*$data_type*examples");
    }

    print "rsync -av ./training_examples_full/$name.*$data_type*examples ./training_examples_selected\n";
    
    push(@data_types, $data_type);
}

foreach my $i (0..$s3_take-1) {
    my $data_type = shift(@data_types);

    my $sample = shift(@s3);
    my $name = $id_mapping{$sample};

    my @files = glob("./training_examples_full/$name.*$data_type*examples");
    while (scalar(@files) != 18) {
        $sample = shift(@s3);
        $name = $id_mapping{$sample};
        @files = glob("./training_examples_full/$name.*$data_type*examples");
    }
    print "rsync -av ./training_examples_full/$name.*$data_type*examples ./training_examples_selected\n";
    
    push(@data_types, $data_type);
}

#
#
#
# Now selection validation examples
#
# Grab 3 of each, 1 of each downsampling fraction (100%, 85%, and 75%)
#

@data_types = ("ds0", "ds30", "ds40", "ds60");

# print join("\t", @data_types) . "\n";

foreach my $i (0..2) {
    my $data_type = shift(@data_types);

    my $sample = shift(@s1);
    my $name = $id_mapping{$sample};

    my @files = glob("./training_examples_full/$name.*$data_type*examples");
    while (scalar(@files) != 18) {
        $sample = shift(@s1);
        $name = $id_mapping{$sample};
        @files = glob("./training_examples_full/$name.*$data_type*examples");
    }
    
    print "rsync -av ./training_examples_full/$name.*$data_type*examples ./validation_examples_selected\n";
    
    push(@data_types, $data_type);
}

foreach my $i (0..2) {
    my $data_type = shift(@data_types);

    my $sample = shift(@s2);
    my $name = $id_mapping{$sample};

    my @files = glob("./training_examples_full/$name.*$data_type*examples");
    while (scalar(@files) != 18) {
        $sample = shift(@s2);
        $name = $id_mapping{$sample};
        @files = glob("./training_examples_full/$name.*$data_type*examples");
    }

    print "rsync -av ./training_examples_full/$name.*$data_type*examples ./validation_examples_selected\n";
    
    push(@data_types, $data_type);
}

foreach my $i (0..2) {
    my $data_type = shift(@data_types);

    my $sample = shift(@s3);
    my $name = $id_mapping{$sample};

    my @files = glob("./training_examples_full/$name.*$data_type*examples");
    while (scalar(@files) != 18) {
        $sample = shift(@s3);
        $name = $id_mapping{$sample};
        @files = glob("./training_examples_full/$name.*$data_type*examples");
    }
    print "rsync -av ./training_examples_full/$name.*$data_type*examples ./validation_examples_selected\n";
    
    push(@data_types, $data_type);
}
