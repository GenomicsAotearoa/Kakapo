# This file was produced by plot-vcfstats, the command line was:
#   plot-vcfstats -p pruned2 -s -t Kakapo Early -v pruned_stats
#
# Edit as necessary and recreate the plots by running
#   python3 plot.py
#
# Title abbreviations:
# 	 0 .. Kakapo Early .. plink2_pruned.vcf.vcf
#

img_fmt = 'pdf'

# Use logarithimic X axis for allele frequency plots
af_xlog = 0

# Plots to generate, set to 0 to disable
plot_venn_snps = 1
plot_venn_indels = 1
plot_tstv_by_sample = 1
plot_hethom_by_sample = 1
plot_snps_by_sample = 1
plot_indels_by_sample = 1
plot_singletons_by_sample = 1 
plot_depth_by_sample = 1
plot_SNP_count_by_af = 1
plot_Indel_count_by_af = 1
plot_SNP_overlap_by_af = 1
plot_Indel_overlap_by_af = 1
plot_dp_dist = 1
plot_hwe = 1
plot_concordance_by_af = 1
plot_r2_by_af = 1
plot_discordance_by_sample = 1
plot_tstv_by_af = 1
plot_indel_dist = 1
plot_indel_vaf = 1
plot_tstv_by_qual = 1
plot_substitutions = 1


# Set to 1 to use sample names for xticks instead of numeric sequential IDs
#   and adjust margins and font properties if necessary
sample_names   = 1
sample_margins = {'right':0.98, 'left':0.07, 'bottom':0.2}
sample_font    = {'rotation':45, 'ha':'right', 'fontsize':8}

if sample_names==0: sample_margins=(); sample_font=();


#-------------------------------------------------


import matplotlib as mpl
mpl.use('Agg')
import matplotlib.pyplot as plt

import csv
csv.register_dialect('tab', delimiter='\t', quoting=csv.QUOTE_NONE)

import numpy
def smooth(x,window_len=11,window='hanning'):
    if x.ndim != 1: raise ValueError("The function 'smooth' only accepts 1 dimension arrays.")
    if x.size < window_len: return x
    if window_len<3: return x
    if not window in ['flat', 'hanning', 'hamming', 'bartlett', 'blackman']: raise ValueError("Window is on of 'flat', 'hanning', 'hamming', 'bartlett', 'blackman'")
    s = numpy.r_[x[window_len-1:0:-1],x,x[-1:-window_len:-1]]
    if window == 'flat': # moving average
        w = numpy.ones(window_len,'d')
    else:
        w = eval('numpy.'+window+'(window_len)')
    y = numpy.convolve(w/w.sum(),s,mode='valid')
    return y[(window_len//2-1):-(window_len//2)]


dat = {}
with open('counts_by_af.snps.dat', 'r') as f:
    reader = csv.reader(f, 'tab')
    for row in reader:
        if row[0][0] == '#': continue
        id = int(row[0])
        if id not in dat: dat[id] = []
        dat[id].append([float(row[1]),float(row[2])])

if plot_SNP_count_by_af:
    fig = plt.figure(figsize=(2*4.33070866141732,3.93700787401575*0.7))
    ax1 = fig.add_subplot(111)
    ax1.set_ylabel('Number of sites')
    ax1.ticklabel_format(style='sci', scilimits=(0,0), axis='y')
    ax1.set_yscale('log')
    if af_xlog: ax1.set_xscale('log')
    ax1.set_xlabel('Non-reference allele frequency')
    ax1.set_xlim(-0.05,1.05)
    has_data = 0
        
if 0 in dat and len(dat[0])>2:
    ax1.plot([row[0] for row in dat[0]], [row[1] for row in dat[0]], '-o',markersize=3, color='orange',mec='orange',label='Kakapo Early')
    has_data = 1
        
if has_data:
    ax1.legend(numpoints=1,markerscale=1,loc='best',prop={'size':10},frameon=False)
    plt.title('SNP count by AF')
    plt.subplots_adjust(bottom=0.2,left=0.1,right=0.95)
    plt.savefig('counts_by_af.snps.png')
    if img_fmt != 'png': plt.savefig('counts_by_af.snps.' + img_fmt)
    plt.close()


        
dat = {}
with open('counts_by_af.indels.dat', 'r') as f:
    reader = csv.reader(f, 'tab')
    for row in reader:
        if row[0][0] == '#': continue
        id = int(row[0])
        if id not in dat: dat[id] = []
        dat[id].append([float(row[1]),float(row[2])])

if plot_Indel_count_by_af:
    fig = plt.figure(figsize=(2*4.33070866141732,3.93700787401575*0.7))
    ax1 = fig.add_subplot(111)
    ax1.set_ylabel('Number of sites')
    ax1.ticklabel_format(style='sci', scilimits=(0,0), axis='y')
    ax1.set_yscale('log')
    if af_xlog: ax1.set_xscale('log')
    ax1.set_xlabel('Non-reference allele frequency')
    ax1.set_xlim(-0.05,1.05)
    has_data = 0
        
if 0 in dat and len(dat[0])>2:
    ax1.plot([row[0] for row in dat[0]], [row[1] for row in dat[0]], '-o',markersize=3, color='orange',mec='orange',label='Kakapo Early')
    has_data = 1
        
if has_data:
    ax1.legend(numpoints=1,markerscale=1,loc='best',prop={'size':10},frameon=False)
    plt.title('Indel count by AF')
    plt.subplots_adjust(bottom=0.2,left=0.1,right=0.95)
    plt.savefig('counts_by_af.indels.png')
    if img_fmt != 'png': plt.savefig('counts_by_af.indels.' + img_fmt)
    plt.close()


        
dat = []
with open('tstv_by_af.0.dat', 'r') as f:
    reader = csv.reader(f, 'tab')
    for row in reader:
        if row[0][0] != '#': dat.append([float(x) for x in row])


if plot_tstv_by_af and len(dat)>2:
    fig = plt.figure(figsize=(4.33070866141732,3.93700787401575))
    ax1 = fig.add_subplot(111)
    ax1.plot([row[0] for row in dat], [row[1] for row in dat], '-o',color='k',mec='k',markersize=3)
    ax1.set_ylabel('Number of sites',color='k')
    ax1.set_yscale('log')
    #ax1.ticklabel_format(style='sci', scilimits=(0,0), axis='y')
    for tl in ax1.get_yticklabels(): tl.set_color('k')
    ax1.set_xlabel('Non-ref allele frequency')
    ax2 = ax1.twinx()
    ax2.plot([row[0] for row in dat], [row[2] for row in dat], '-o',color='orange',mec='orange',markersize=3)
    ax2.set_ylabel('Ts/Tv',color='orange')
    ax2.set_ylim(0,0.5+max(3,max(row[2] for row in dat)))
    ax1.set_xlim(0,1)
    for tl in ax2.get_yticklabels(): tl.set_color('orange')
    plt.subplots_adjust(right=0.88,left=0.15,bottom=0.11)
    plt.title('Kakapo Early')
    plt.savefig('tstv_by_af.0.png')
    if img_fmt != 'png': plt.savefig('tstv_by_af.0.' + img_fmt)
    plt.close()

        
dat = []
with open('tstv_by_qual.0.dat', 'r') as f:
    reader = csv.reader(f, 'tab')
    for row in reader:
        if row[0][0] != '#': dat.append([float(x) for x in row])

if plot_tstv_by_qual and len(dat)>2:
    fig = plt.figure(figsize=(4.33070866141732,3.93700787401575))
    ax1 = fig.add_subplot(111)
    ax1.plot([row[1] for row in dat], [row[2] for row in dat], '^-', ms=3, mec='orange', color='orange')
    ax1.set_ylabel('Ts/Tv',fontsize=10)
    ax1.set_xlabel('Number of sites\n(sorted by QUAL, descending)',fontsize=10)
    ax1.ticklabel_format(style='sci', scilimits=(-3,2), axis='x')
    ax1.set_ylim(min(2,min(row[2] for row in dat))-0.3,0.3+max(2.2,max(row[2] for row in dat)))

    plt.subplots_adjust(right=0.88,left=0.15,bottom=0.15)
    plt.title('Kakapo Early')
    plt.savefig('tstv_by_qual.0.png')
    if img_fmt != 'png': plt.savefig('tstv_by_qual.0.' + img_fmt)
    plt.close()

        
dat = [
        
[0,'A>C',16923],
[1,'A>G',77724],
[2,'A>T',15159],
[3,'C>A',39058],
[4,'C>G',21561],
[5,'C>T',107431],
[6,'G>A',110452],
[7,'G>C',23247],
[8,'G>T',40989],
[9,'T>A',16560],
[10,'T>C',80057],
[11,'T>G',15061],
]
if plot_substitutions:
    fig = plt.figure(figsize=(4.33070866141732,3.93700787401575))
    cm  = mpl.cm.get_cmap('autumn')
    n = 12
    col = []
    for i in list(range(n)): col.append(cm(1.*i/n))
    ax1 = fig.add_subplot(111)
    ax1.bar([row[0] for row in dat], [row[2] for row in dat], color=col)
    ax1.set_ylabel('Count')
    ax1.ticklabel_format(style='sci', scilimits=(0,0), axis='y')
    ax1.set_xlim(-0.5,n+0.5)
    plt.xticks([row[0] for row in dat],[row[1] for row in dat],rotation=45)
    plt.title('Kakapo Early')
    plt.savefig('substitutions.0.png')
    if img_fmt != 'png': plt.savefig('substitutions.0.' + img_fmt)
    plt.close()

        
dat = []
with open('tstv_by_sample.0.dat', 'r') as f:
    reader = csv.reader(f, 'tab')
    for row in reader:
        if row[0][0] != '#': dat.append([float(x) for x in row[:7]] + [row[7]])

if plot_tstv_by_sample:
    fig = plt.figure(figsize=(2*4.33070866141732,3.93700787401575*0.7))
    ax1 = fig.add_subplot(111)
    ax1.plot([row[0] for row in dat], [row[1] for row in dat], 'o', color='orange',mec='orange')
    ax1.set_ylabel('Ts/Tv')
    ax1.set_ylim(min(float(row[1]) for row in dat)-0.1,max(float(row[1]) for row in dat)+0.1)
    if sample_names:
        plt.xticks([int(row[0]) for row in dat],[row[7] for row in dat],**sample_font)
        plt.subplots_adjust(**sample_margins)
    else:
        plt.subplots_adjust(right=0.98,left=0.07,bottom=0.17)
        ax1.set_xlabel('Sample ID')
    plt.title('Kakapo Early')
    plt.savefig('tstv_by_sample.0.png')
    if img_fmt != 'png': plt.savefig('tstv_by_sample.0.' + img_fmt)
    plt.close()


if plot_hethom_by_sample:
    fig = plt.figure(figsize=(2*4.33070866141732,3.93700787401575*0.7))
    ax1 = fig.add_subplot(111)
    ax1.plot([row[0] for row in dat], [row[2] for row in dat], 'o', color='orange',mec='orange')
    ax1.set_ylabel('nHet(RA) / nHom(AA)')
    ax1.ticklabel_format(style='sci', scilimits=(0,0), axis='y')
    if sample_names:
        plt.xticks([int(row[0]) for row in dat],[row[7] for row in dat],**sample_font)
        plt.subplots_adjust(**sample_margins)
    else:
        plt.subplots_adjust(right=0.98,left=0.07,bottom=0.17)
        ax1.set_xlabel('Sample ID')
    plt.title('Kakapo Early')
    plt.savefig('hets_by_sample.0.png')
    if img_fmt != 'png': plt.savefig('hets_by_sample.0.' + img_fmt)
    plt.close()


if plot_snps_by_sample:
    fig = plt.figure(figsize=(2*4.33070866141732,3.93700787401575*0.7))
    ax1 = fig.add_subplot(111)
    ax1.plot([row[0] for row in dat], [row[3] for row in dat], 'o', color='orange',mec='orange')
    ax1.set_ylabel('Number of SNPs')
    ax1.ticklabel_format(style='sci', scilimits=(0,0), axis='y')
    if sample_names:
        plt.xticks([int(row[0]) for row in dat],[row[7] for row in dat],**sample_font)
        plt.subplots_adjust(**sample_margins)
    else:
        plt.subplots_adjust(right=0.98,left=0.07,bottom=0.17)
        ax1.set_xlabel('Sample ID')
    plt.title('Kakapo Early')
    plt.savefig('snps_by_sample.0.png')
    if img_fmt != 'png': plt.savefig('snps_by_sample.0.' + img_fmt)
    plt.close()


if plot_indels_by_sample:
    fig = plt.figure(figsize=(2*4.33070866141732,3.93700787401575*0.7))
    ax1 = fig.add_subplot(111)
    ax1.plot([row[0] for row in dat], [row[4] for row in dat], 'o', color='orange',mec='orange')
    ax1.set_ylabel('Number of indels')
    ax1.ticklabel_format(style='sci', scilimits=(0,0), axis='y')
    if sample_names:
        plt.xticks([int(row[0]) for row in dat],[row[7] for row in dat],**sample_font)
        plt.subplots_adjust(**sample_margins)
    else:
        plt.subplots_adjust(right=0.98,left=0.07,bottom=0.17)
        ax1.set_xlabel('Sample ID')
    plt.title('Kakapo Early')
    plt.savefig('indels_by_sample.0.png')
    if img_fmt != 'png': plt.savefig('indels_by_sample.0.' + img_fmt)
    plt.close()


if plot_singletons_by_sample:
    fig = plt.figure(figsize=(2*4.33070866141732,3.93700787401575*0.7))
    ax1 = fig.add_subplot(111)
    ax1.plot([row[0] for row in dat], [row[6] for row in dat], 'o', color='orange',mec='orange')
    ax1.set_ylabel('Number of singletons')
    ax1.ticklabel_format(style='sci', scilimits=(0,0), axis='y')
    if sample_names:
        plt.xticks([int(row[0]) for row in dat],[row[7] for row in dat],**sample_font)
        plt.subplots_adjust(**sample_margins)
    else:
        plt.subplots_adjust(right=0.98,left=0.07,bottom=0.17)
        ax1.set_xlabel('Sample ID')
    plt.title('Kakapo Early')
    plt.savefig('singletons_by_sample.0.png')
    if img_fmt != 'png': plt.savefig('singletons_by_sample.0.' + img_fmt)
    plt.close()


if plot_depth_by_sample:
    fig = plt.figure(figsize=(2*4.33070866141732,3.93700787401575*0.7))
    ax1 = fig.add_subplot(111)
    ax1.plot([row[0] for row in dat], [row[5] for row in dat], 'o', color='orange',mec='orange')
    ax1.set_ylabel('Average depth')
    ax1.ticklabel_format(style='sci', scilimits=(0,0), axis='y')
    if sample_names:
        plt.xticks([int(row[0]) for row in dat],[row[7] for row in dat],**sample_font)
        plt.subplots_adjust(**sample_margins)
    else:
        plt.subplots_adjust(right=0.98,left=0.07,bottom=0.17)
        ax1.set_xlabel('Sample ID')
    plt.title('Kakapo Early')
    plt.savefig('dp_by_sample.0.png')
    if img_fmt != 'png': plt.savefig('dp_by_sample.0.' + img_fmt)
    plt.close()

        
dat = []
with open('hwe.0.dat', 'r') as f:
    reader = csv.reader(f, 'tab')
    for row in reader:
        if row[0][0] != '#': dat.append(row)

if plot_hwe and len(dat)>1:
    x  = [float(row[0]) for row in dat]
    y1 = smooth(numpy.array([float(row[2]) for row in dat]),40,'hanning')
    y2 = smooth(numpy.array([float(row[3]) for row in dat]),40,'hanning')
    y3 = smooth(numpy.array([float(row[4]) for row in dat]),40,'hanning')
    dp = smooth(numpy.array([float(row[1]) for row in dat]),40,'hanning')
    hwe = []
    for af in x: hwe.append(2*af*(1-af))

    fig = plt.figure(figsize=(4.33070866141732,3.93700787401575))
    ax1 = fig.add_subplot(111)
    plots  = ax1.plot(x,hwe,'--',color='#ff9900',label='Expected (HWE)')
    plots += ax1.plot(x,y2,color='#ff9900',label='Median')
    plots += ax1.plot(x,y3,color='#ffe0b2',label='25-75th percentile')
    ax1.fill_between(x,y1,y3, facecolor='#ffeacc',edgecolor='#ffe0b2')
    ax1.set_ylabel('Fraction of hets',color='#ff9900')
    ax1.set_xlabel('Allele frequency')
    for tl in ax1.get_yticklabels(): tl.set_color('#ff9900')
    ax2 = ax1.twinx()
    plots += ax2.plot(x,dp, 'k', label='Number of sites')
    ax2.set_ylabel('Number of sites')
    ax2.set_yscale('log')
    if af_xlog: ax1.set_xscale('log')
    if af_xlog: ax2.set_xscale('log')
    labels = [l.get_label() for l in plots]
    plt.legend(plots,labels,numpoints=1,markerscale=2,loc='center',prop={'size':9},frameon=False)
    plt.subplots_adjust(left=0.15,bottom=0.15,right=0.86)
    plt.title('Kakapo Early')
    plt.savefig('hwe.0.png')
    if img_fmt != 'png': plt.savefig('hwe.0.' + img_fmt)
    plt.close()

        
