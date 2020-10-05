from glob import glob
import pandas as pd
import numpy as np

# 0.7_0.2_0.05_113_test_+_0.7_0.2_0.05_113_tassel_pheno_stats.txt

findfile = glob("*_stats.txt")

fname = findfile[0].split("_test")[0]
results = pd.read_csv(findfile[0], sep="\t",)
results['-log10p'] = -np.log10(results['p'])
# print(results['-log10p'])

test_pval = results[results['Pos'] == 112999]['-log10p'].values[0]
without_test = results.drop(results[results['Pos'] == 112999].index)
max_nontest_pval = np.max(without_test['-log10p'])

print("\t".join([str(test_pval), str(max_nontest_pval)]))
