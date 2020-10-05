import pandas as pd
import plotly.graph_objects as go
import glob
import math
import os
import sys
from functools import reduce

chr = 1

def readstatsfile(filename):
    stats = pd.read_csv(filename, header=0, sep="\t")
    stats = stats[stats.Pos.notnull()]
    stats['file'] = filename
    stats['-log10p'] = stats['p'].apply(lambda x: -math.log10(x))
    stats = stats[stats['-log10p'].notnull()]
    return stats

def get_averages(current, chr, file):
    run = os.path.basename(file).split("_")[0]
    stats = readstatsfile(file)
    stats.reset_index(drop=True, inplace=True)
    stats_chr = stats[stats['Chr'] == chr]
    new = stats_chr[['Pos','-log10p']]
    new = new.rename(columns={'-log10p': run})
    return current.merge(new)


files = glob.glob("GwasOutputGlobal_2000/*_stats.txt.gz")

stats = readstatsfile(files[0])
stats.reset_index(drop=True, inplace=True)
stats_chr = stats[stats['Chr'] == chr]
run = os.path.basename(files[0]).split("_")[0]
initial_state = stats_chr[['Pos','-log10p']]
#initial_state['Max'] = initial_state['-log10p']
#initial_state['Min'] = initial_state['-log10p']
initial_state = initial_state.rename(columns={'-log10p': 0})

data = reduce(lambda x, y: get_averages(x, chr, y), files, initial_state)

output = pd.DataFrame()
output['Pos'] = data['Pos']
output['mean'] = data[data.columns[~data.columns.isin(['Pos'])]].mean(axis=1)
output['max'] = data[data.columns[~data.columns.isin(['Pos'])]].max(axis=1)
output['min'] = data[data.columns[~data.columns.isin(['Pos'])]].min(axis=1)

fig = go.Figure()

fig.add_trace(
    go.Scattergl(x=output['Pos'], 
                 y=output['mean'], 
                 mode='markers',
                 name="Mean",
                 marker=dict(
                     size=4,
                     opacity=0.6,
                     colorscale='mygbm'
                 )))

fig.add_trace(
    go.Scattergl(x=output['Pos'], 
                 y=output['max'], 
                 name="Max",
                 mode='markers',
                 marker=dict(
                     size=4,
                     opacity=0.6,
                     colorscale='mygbm'
                 )))

fig.add_trace(
    go.Scattergl(x=output['Pos'], 
                 y=output['min'], 
                 name="Min",
                 mode='markers',
                 marker=dict(
                     size=4,
                     opacity=0.6,
                     colorscale='mygbm'
                 )))

fig.update_layout(width=2800, height=800)

# fig.show()
fig.write_image("chr" + str(chr) + "gwas_global_plot.jpeg")
fig.write_image("chr" + str(chr) + "gwas_global_plot.svg")
fig.write_image("chr" + str(chr) + "gwas_global_plot.pdf")
