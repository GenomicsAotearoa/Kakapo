#!/usr/bin/env python
"""Convert from a VCF to the AlphaPeel v0.1.0 format. The format is "transposed"
from the VCF format - lines are individuals, and columns are sites. There are
two lines per individual: one for the reference read counts, and one for the
alternate read counts. Takes two arguments:
    1) Cleaned VCF with read depth information (Gzipped)
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
                out_ref = []
                out_alt = []
                for s in samples:
                    out_ref.append([s])
                    out_alt.append([s])
            else:
                tmp = line.strip().split()
                # We are only interested in one chromosome at a time
                if tmp[0] != chrom:
                    continue
                else:
                    # Check if we are operating on a known SNP. If we are, then
                    # we will just distribute 20 reads into all ref, all alt,
                    # or split evenly, depending on the genotype.
                    if '11_' in tmp[2] or '12_' in tmp[2]:
                        known = True
                    else:
                        known = False
                    fmt = tmp[8].split(':')
                    if 'AD' not in fmt:
                        ad_col = None
                    else:
                        ad_col = fmt.index('AD')
                    gt_col = tmp[8].split(':').index('GT')
                    for index, field in enumerate(tmp[9:]):
                        if not ad_col:
                            ad = None
                        else:
                            ad = field.split(':')[ad_col]
                        gt = field.split(':')[gt_col]
                        if known:
                            if ad == '.' or not ad:
                                if gt == '0/0':
                                    out_ref[index].append('20')
                                    out_alt[index].append('0')
                                elif gt == '0/1' or gt == '1/0':
                                    out_ref[index].append('10')
                                    out_alt[index].append('10')
                                elif gt == '1/1':
                                    out_ref[index].append('20')
                                    out_alt[index].append('0')
                                else:
                                    out_ref[index].append('0')
                                    out_alt[index].append('0')
                            else:
                                dp = ad.split(',')
                                out_ref[index].append(dp[0])
                                out_alt[index].append(dp[1])
                        else:
                            if ad == '.' or not ad:
                                out_ref[index].append('0')
                                out_alt[index].append('0')
                            else:
                                dp = ad.split(',')
                                out_ref[index].append(dp[0])
                                out_alt[index].append(dp[1])
    # Print out the samples
    for r, a in zip(out_ref, out_alt):
        print(' '.join(r))
        print(' '.join(a))
    return


if len(sys.argv) != 3:
    print("""Convert from a VCF to the AlphaPeel v0.1.0 format. The format is "transposed"
from the VCF format - lines are individuals, and columns are sites. There are
two lines per individual: one for the reference read counts, and one for the
alternate read counts. Takes two arguments:
    1) Cleaned VCF with read depth information (Gzipped)
    2) Chromosome""")
    exit(1)
else:
    main(sys.argv[1], sys.argv[2])
