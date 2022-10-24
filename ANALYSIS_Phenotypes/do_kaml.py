import pandas as pd
import numpy as np
import plotly.express as px
import os

remove = 0.15
repeats = 10

fam = pd.read_csv("../../software/gcta_1.93.2beta/plink2.fam", sep="\t", header=None)

birds = list()

for i, row in fam.iterrows():
    birds.append(row[1])

pheno_dict = dict()

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

pheno = pd.read_csv("egg_ratio_means_early.tsv", sep="\t")
for i, row in pheno.iterrows():
    pheno_dict[row["motherName"]] = row["ratio"]

pheno = pheno_dict

preds = pd.DataFrame(index=birds)
gebvs = pd.DataFrame(index=birds)
masks = pd.DataFrame(index=birds)

run = 0

for i in range(repeats):
    # Removal Percentage
    remove_chance = np.random.rand(len(birds))

    ones_to_care_about = list()

    mask = list()

    with open("rand.tsv", "w") as fh:
        fh.write("\t".join(["bird", "vals"]))
        fh.write("\n")

        for n, bird in enumerate(birds):
            if remove_chance[n] > remove and bird in pheno:
                mask.append(0)
                fh.write("\t".join([bird, str(pheno[bird])]))
            elif bird in pheno:
                mask.append(1)
                fh.write("\t".join([bird, "NA"]))
                ones_to_care_about.append(bird)
            else:
                mask.append(2)
                fh.write("\t".join([bird, "NA"]))

            fh.write("\n")

    ones_to_care_about = set(ones_to_care_about)
    print(len(ones_to_care_about))

    os.system("Rscript run_KAML.R")

    cs_pred = pd.read_csv("rand_prediction.txt", sep="\s+")
    preds[run] = cs_pred["vals"].to_list()

    cs_gebv = pd.read_csv("rand_prediction_gebv.txt", sep="\s+")
    gebvs[run] = cs_gebv["vals"].to_list()

    masks[run] = mask

    run += 1

correlations = list()

for runq in range(repeats):
    xs = list()
    ys = list()
    for n, bird in enumerate(birds):
        if bird in pheno:  # and bird in ones_to_care_about:
            if masks[runq][bird] == 1:
                xs.append(pheno[bird])
                ys.append(gebvs[runq][n])
    correlations.append(np.corrcoef(xs, ys)[0][1])

correlations = np.asarray(correlations)
correlations = correlations[correlations >= 0]

print([np.mean(correlations), np.std(correlations)])
print("Remove portion {}, Repeats {}".format(str(remove), str(repeats)))
