#!/usr/bin/env python
"""Convert from a VCF to the AlphaPeel v0.1.0 format. The format is "transposed"
from the VCF format - lines are individuals, and columns are sites. There is one
line per individual. Genotypes are coded as 0 (hom ref), 1 (het), and 2 
(hom alt). Takes two arguments:
    1) Cleaned VCF (Gzipped)
    2) Chromosome
"""

import sys
import gzip


def main(vcf, chrom):
    """Main function."""
    with gzip.open(vcf, 'rt') as f:
        for line in f:
            if line.startswith('##'):
                continue
            elif line.startswith('#CHROM'):
                # Save the samples
                samples = line.strip().split()[9:]
                out = [[s] for s in samples]
            else:
                tmp = line.strip().split()
                # We are only interested in one chromosome at a time
                if tmp[0] != chrom:
                    continue
                else:
                    gt_col = tmp[8].split(':').index('GT')
                    gt = [f.split(':')[gt_col] for f in tmp[9:]]
                    for i, g in enumerate(gt):
                        if g == '0/0':
                            out[i].append('0')
                        elif g == '0/1' or g == '1/0':
                            out[i].append('1')
                        elif g == '1/1':
                            out[i].append('2')
                        else:
                            out[i].append('9')
    # Print out the samples
    for samp in out:
        print(' '.join(samp))
    return


if len(sys.argv) != 3:
    print("""Convert from a VCF to the AlphaPeel v0.1.0 format. The format is "transposed"
from the VCF format - lines are individuals, and columns are sites. There are
two lines per individual: one for the reference read counts, and one for the
alternate read counts. Takes two arguments:
    1) Cleaned VCF (Gzipped)
    2) Chromosome""")
    exit(1)
else:
    main(sys.argv[1], sys.argv[2])
