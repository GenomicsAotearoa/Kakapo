mkdir alignments-separate
cd alignments-separate
cp -sH ../../02_Alignments_to_Reference/results/alignments/*cram .
cp -sH ../../02_Alignments_to_Reference/results/alignments/*crai .
# Remove Sarah's sequencing run that did not come out properly
rm Sarah-2_00*
