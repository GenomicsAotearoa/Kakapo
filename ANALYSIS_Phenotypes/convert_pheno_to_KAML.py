import pandas as pd
import numpy as np
import os

fam = pd.read_csv("../../software/gcta_1.93.2beta/plink2.fam", sep="\t", header=None)

birds = list()

for i, row in fam.iterrows():
    birds.append(row[1])

pheno_dict = dict()

phenotype = "clutchsize"
pheno = pd.read_csv("clutch_size_new_randomonly.tsv", sep="\t", skiprows=2)
for i, row in pheno.iterrows():
    pheno_dict[row["bird"]] = row["vals"]

# pheno = pd.read_csv("weights.txt", sep="\t")
# for i,row in pheno.iterrows():
#    pheno_dict[row['Taxa']] = row['M']

# pheno = pd.read_csv("clutch_size.tsv", sep="\t")
# for i,row in pheno.iterrows():
#    pheno_dict[row['bird']] = row['vals']

# pheno = pd.read_csv("embryo_survival.tsv", sep="\t", skiprows=2)
# for i,row in pheno.iterrows():
#    pheno_dict[row['Taxa']] = row['SurvivingEmbryos']

# pheno = pd.read_csv("slow_crop.txt", sep="\t", skiprows=2)
# for i,row in pheno.iterrows():
# 	pheno_dict[row['Taxa']] = row['SlowCrop']

# pheno = pd.read_csv("cloacitis_offspring_pheno.txt", sep="\t", skiprows=2)
# for i,row in pheno.iterrows():
# 	pheno_dict[row['Taxa']] = row['Cloacitis']

# pheno = pd.read_csv("egg_ratio_means_early.tsv", sep="\t")
# for i,row in pheno.iterrows():
# 	pheno_dict[row['motherName']] = row['ratio']

pheno = pheno_dict

# preds = pd.DataFrame(index=birds)
# gebvs = pd.DataFrame(index=birds)
# masks = pd.DataFrame(index=birds)

with open("{}_kaml.tsv".format(phenotype), "w") as fh:
    fh.write("\t".join(["bird", "vals"]))
    fh.write("\n")

    for n, bird in enumerate(birds):
        if bird in pheno:
            fh.write("\t".join([bird, str(pheno[bird])]))
        else:
            fh.write("\t".join([bird, "NA"]))

        fh.write("\n")

print("File {}_kaml.tsv written".format(phenotype))
