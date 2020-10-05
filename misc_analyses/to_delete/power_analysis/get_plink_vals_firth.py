from glob import glob
import pandas as pd
import numpy as np

# 0.7_0.2_0.05_113_test_+_0.7_0.2_0.05_113_tassel_pheno_stats.txt

findfile = glob("test.PHENO1.glm.firth")
#print(findfile[0])
results = pd.read_csv(findfile[0], sep="\t", low_memory=False)
#print(results.columns)
#results = results[results["TEST"] == "ADD"]
results['-log10p'] = -np.log10(results['P'])
# print(results['-log10p'])

test_pval = 0
max_nontest_pval = 0

#test_pval = results[results['POS'] == 112999]['-log10p'].values[0]
#without_test = results.drop(results[results['POS'] == 112999].index)
#max_nontest_pval = np.max(without_test['-log10p'])

test_pval = max(results[results['POS'] == 112999]['-log10p'].values[0], test_pval)
without_test = results.drop(results[results['POS'] == 112999].index)
max_nontest_pval = max(max_nontest_pval, np.nanmax(without_test['-log10p']))

print("\t".join([str(test_pval), str(max_nontest_pval)]))


