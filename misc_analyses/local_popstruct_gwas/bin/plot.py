#!/usr/bin/env python
import pandas as pd
import plotly.graph_objects as go
import glob
import math
import os
import sys

def getchrs(dir):
    chrs = dict()
    chr_files = glob.glob(dir + "/*kinship.txt")
    for chrfile in chr_files:
        chr = os.path.basename(chrfile).split("_")[0]
        chrs[chr] = 0
    
    chrs = list(chrs.keys())
    return(chrs)

def readstatsfile(filename):
    stats = pd.read_csv(filename, header=0, sep="\t")
    stats = stats[stats.Pos.notnull()]
    stats['file'] = filename
    stats['p'] = stats['p'].apply(lambda x: -math.log10(x))
    return stats

def plotchromosome(dir, chr):
    files = glob.glob(dir + "/" + str(chr) + "_*stats.txt")
    stats = pd.concat(map(readstatsfile, files))
    stats['file'] = pd.Categorical(stats['file'])
    stats['file_entry'] = stats['file'].cat.codes
    makeplot(stats, chr)

def makeplot(stats, chr):
    fig = go.Figure()

    fig.add_trace(
        go.Scatter(x=stats['Pos'], 
                     y=stats['p'], 
                     mode='markers',
                     marker=dict(
                         size=4,
                         color=stats['file_entry'],
                         colorscale='mygbm'
                     )))
    fig.write_image("chr" + str(chr) + "gwas_plot.jpeg")
    fig.write_image("chr" + str(chr) + "gwas_plot.svg")
    fig.write_image("chr" + str(chr) + "gwas_plot.pdf")


directory = sys.argv[1]
chrs = getchrs(directory)
for chr in chrs:
    plotchromosome(directory, chr)
