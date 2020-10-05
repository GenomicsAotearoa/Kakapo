import numpy as np
import pandas as pd
import argparse as ap

from cyvcf2 import VCF
# Need to cite:
# https://github.com/brentp/cyvcf2

parser = ap.ArgumentParser(description="Simulate GWAS Stuff")
parser.add_argument('--vcf', action="store")
parser.add_argument('--penetrance', action="store", type=float)
parser.add_argument('--pheno_frequency', action='store', type=float)
parser.add_argument('--error', action='store', type=float)
parser.add_argument('--pos', action='store', type=int)
parser.add_argument('--landmark', action='store')
parser.add_argument('--snpid', action='store')
parser.add_argument('--dom', action="store_true")
parser.add_argument('--out', action="store")
parser.add_argument('--plink_family', action="store")
parser.add_argument('-n', action="store", type=int)

results = parser.parse_args();

def get_samples(vcf_file):
    return VCF(vcf_file).samples

def get_landmarks(vcf_file):
    return VCF(vcf_file).seqnames

def simulate_binary_mendelian_dominant_phenotype(
    samples, 
    penetrance, 
    error, 
    pheno_frequency):

    n = len(samples)
    alleles = np.random.rand((n))
    phenos  = np.random.rand((n))
    
    trait   = phenos < pheno_frequency
    notrait = phenos > pheno_frequency
    phenos[trait] = True
    phenos[notrait] = False
    
    # Alleles need to happen here
    trait = np.count_nonzero(phenos==1)/n
    p = 1 - trait
    q = 1 - p
    
    # Het is 2pq
    p_freq = np.square(p)
    q_freq = np.square(q)
    het_freq = 2 * p * q
    
    for (i, pheno) in enumerate(phenos):
        if not pheno:
            alleles[i] = 0;
        else:
            if alleles[i] <= q_freq:
                alleles[i] = 2
            else:
                alleles[i] = 1
        
    # Penetrance
    penetrances = np.random.rand((n))
    for (i, pheno) in enumerate(phenos):
        if pheno:
            if penetrances[i] >= penetrance:
                phenos[i] = False
                
    errors = np.random.rand((n))
    for (i, pheno) in enumerate(phenos):
        if errors[i] <= error:
            phenos[i] = not phenos[i]
    
    # Error
    return phenos, alleles

def generate_files(i, filestart, samples, penetrance, errors, pheno_freq):
    penetrance = np.around(penetrance, 2)
    errors = np.around(errors, 2)
    pheno_freq = np.around(pheno_freq, 2)
    
    phenos, alleles = simulate_binary_mendelian_dominant_phenotype(samples, penetrance, errors, pheno_freq)
    gts = list()
    
    filestart = filestart + "_p" + str(penetrance) + "_e" + str(errors) + "_pf" + str(pheno_freq) + "_n" + str(i) + "_"

    pheno_file = open(filestart + "plink_pheno.txt", "w")
    for i,pheno in enumerate(phenos):
        if pheno:
            pheno = 2
        else:
            pheno = 1
        pheno_file.write("\t".join([samples[i], samples[i], str(pheno)]))
        pheno_file.write("\n")
    pheno_file.close()

    pheno_file = open(filestart + "tassel_pheno.txt", "w")
    pheno_file.write("<Phenotype>\n")
    pheno_file.write("taxa\tdata\n")
    for i,pheno in enumerate(phenos):
        if pheno:
            pheno = 1
        else:
            pheno = 0
        pheno_file.write("\t".join([samples[i], str(pheno)]))
        pheno_file.write("\n")
    pheno_file.close()

    for allele in alleles:
        gt = '0/0'
        if allele == 1:
            gt = '0/1'
        elif allele == 2:
            gt = '1/1'
        gts.append(gt)

    vcf_line = [str(landmark), str(pos), test_snp_id, "A", "T", "99", ".", "AQ=99", "GT"]
    vcf_line.extend(gts)

    vcf_test_line = open(filestart + "testsnp.vcf", "w")
    vcf_test_line.write("\t".join(vcf_line))
    vcf_test_line.write("\n")
    vcf_test_line.close()

vcf_file = results.vcf
# Dom is ignore, because it's all we can do now!
out_filename = results.out
penetrance = results.penetrance
pheno_frequency = results.pheno_frequency
error = results.error
pos = results.pos
test_snp_id = results.snpid
landmark = results.landmark
plink_family = results.plink_family
repeat_n = results.n

samples = get_samples(vcf_file)
landmarks = get_landmarks(vcf_file)

assert(landmark in landmarks)

for i in range(repeat_n):
    generate_files(i, out_filename, samples, penetrance, error, pheno_frequency)