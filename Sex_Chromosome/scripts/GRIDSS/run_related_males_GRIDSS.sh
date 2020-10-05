#!/bin/bash/ -e
#####################################################################################
#Script for running the GRIDSS software package in a Singularity container. GRIDSS is
#a program for the detection of structural variants from paired-end sequence data.
#####################################################################################

##Setting fixed variables
container=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/
ref=/data/References/kakapo_no_Wchromosome.fa
vcfoutput=/data/GRIDSS/vcf_male/
bamoutput=/data/GRIDSS/bams_male/
#bams=$(ls -lh ${container}alignments_male/bam/sorted/ | awk '{print $9}' | grep -v .bai | grep bam | sort | sed -e 's%^%/data/alignments_male/bam/sorted/%' | xargs)
labels=$(ls -lh ${container}alignments_male/bam/sorted/ | awk '{print $9}' | grep -v .bai | sort | xargs | sed -e "s/.sorted.bam /,/g" | sed -e "s/.sorted.bam//g")

echo "Running GRIDSS for males"

singularity run \
-B ${container}:/data \
gridss_latest.sif \
--reference ${ref} \
--output ${vcfoutput}all_males_gridss.vcf.gz \
--assembly ${bamoutput}all_males_gridss.bam \
--threads 8 \
--labels Jane_noW,Al,Arab,Ariki,Attenborough,Awhero,Barnard,Basil,Ben,Bill,Blades,Blake,Bluster_Murphy,Bonus,Boss,Clout,Dobbie,Doc,Egilsay,Elliot,Elwin,Faulkner,Felix,George,Guapo,Gulliver,Gumboots,Gunner,Henry,Hillary,Hokonui,Horton,Hugh,Hurihuri,Ian,Jack,Jamieson,Jester,Jimmy,Joe,Juanma,Kanawera,Kokoto,Komaru,Konini_3-4-16,Kotiu,Kumi,Lee,Lionel,Luke,Manu,Matangi,Merty,Merv,Moorhouse,Morehu,Moss,Ngatapa,Nog,Oraka,Ox,Paddy,Palmersan,Percy,Piripi,Ralph,Rangi,Richard_Henry,Robbie,Ruapuke,Ruggedy,Sass,Scratch,Sinbad,Sirocco,Smoko,Stumpy,Taeatanga,Takitimu,Tamahou,Tau_Kuhurangi,Te_Atapo,Te_Awa,Te_Here,Te_Kingi,Tiwai,Trevor,Tuterangi,Tutoko,Waihopai,Waynebo,Wharetutu,Whiskas,Wiremu,Wolf \
--workingdir /data/GRIDSS/male \
/data/alignments_female/jane/jane_sim_noW.sorted.bam \
/data/alignments_male/bam/Al.sorted.bam \
/data/alignments_male/bam/Arab.sorted.bam \
/data/alignments_male/bam/Ariki.sorted.bam \
/data/alignments_male/bam/Attenborough.sorted.bam \
/data/alignments_male/bam/Awhero.sorted.bam \
/data/alignments_male/bam/Barnard.sorted.bam \
/data/alignments_male/bam/Basil.sorted.bam \
/data/alignments_male/bam/Ben.sorted.bam \
/data/alignments_male/bam/Bill.sorted.bam \
/data/alignments_male/bam/Blades.sorted.bam \
/data/alignments_male/bam/sorted/Blake.sorted.bam \
/data/alignments_male/bam/sorted/Bluster_Murphy.sorted.bam \
/data/alignments_male/bam/sorted/Bonus.sorted.bam \
/data/alignments_male/bam/sorted/Boss.sorted.bam \
/data/alignments_male/bam/sorted/Clout.sorted.bam \
/data/alignments_male/bam/sorted/Dobbie.sorted.bam \
/data/alignments_male/bam/sorted/Doc.sorted.bam \
/data/alignments_male/bam/sorted/Egilsay.sorted.bam \
/data/alignments_male/bam/sorted/Elliot.sorted.bam \
/data/alignments_male/bam/sorted/Elwin.sorted.bam \
/data/alignments_male/bam/sorted/Faulkner.sorted.bam \
/data/alignments_male/bam/sorted/Felix.sorted.bam \
/data/alignments_male/bam/sorted/George.sorted.bam \
/data/alignments_male/bam/sorted/Guapo.sorted.bam \
/data/alignments_male/bam/sorted/Gulliver.sorted.bam \
/data/alignments_male/bam/sorted/Gumboots.sorted.bam \
/data/alignments_male/bam/sorted/Gunner.sorted.bam \
/data/alignments_male/bam/sorted/Henry.sorted.bam \
/data/alignments_male/bam/sorted/Hillary.sorted.bam \
/data/alignments_male/bam/sorted/Hokonui.sorted.bam \
/data/alignments_male/bam/sorted/Horton.sorted.bam \
/data/alignments_male/bam/sorted/Hugh.sorted.bam \
/data/alignments_male/bam/sorted/Hurihuri.sorted.bam \
/data/alignments_male/bam/sorted/Ian.sorted.bam \
/data/alignments_male/bam/sorted/Jack.sorted.bam \
/data/alignments_male/bam/sorted/Jamieson.sorted.bam \
/data/alignments_male/bam/sorted/Jester.sorted.bam \
/data/alignments_male/bam/sorted/Jimmy.sorted.bam \
/data/alignments_male/bam/sorted/Joe.sorted.bam \
/data/alignments_male/bam/sorted/Juanma.sorted.bam \
/data/alignments_male/bam/sorted/Kanawera.sorted.bam \
/data/alignments_male/bam/sorted/Kokoto.sorted.bam \
/data/alignments_male/bam/sorted/Komaru.sorted.bam \
/data/alignments_male/bam/sorted/Konini_3-4-16.sorted.bam \
/data/alignments_male/bam/sorted/Kotiu.sorted.bam \
/data/alignments_male/bam/sorted/Kumi.sorted.bam \
/data/alignments_male/bam/sorted/Lee.sorted.bam \
/data/alignments_male/bam/sorted/Lionel.sorted.bam \
/data/alignments_male/bam/sorted/Luke.sorted.bam \
/data/alignments_male/bam/sorted/Manu.sorted.bam \
/data/alignments_male/bam/sorted/Matangi.sorted.bam \
/data/alignments_male/bam/sorted/Merty.sorted.bam \
/data/alignments_male/bam/sorted/Merv.sorted.bam \
/data/alignments_male/bam/sorted/Moorhouse.sorted.bam \
/data/alignments_male/bam/sorted/Morehu.sorted.bam \
/data/alignments_male/bam/sorted/Moss.sorted.bam \
/data/alignments_male/bam/sorted/Ngatapa.sorted.bam \
/data/alignments_male/bam/sorted/Nog.sorted.bam \
/data/alignments_male/bam/sorted/Oraka.sorted.bam \
/data/alignments_male/bam/sorted/Ox.sorted.bam \
/data/alignments_male/bam/sorted/Paddy.sorted.bam \
/data/alignments_male/bam/sorted/Palmersan.sorted.bam \
/data/alignments_male/bam/sorted/Percy.sorted.bam \
/data/alignments_male/bam/sorted/Piripi.sorted.bam \
/data/alignments_male/bam/sorted/Ralph.sorted.bam \
/data/alignments_male/bam/sorted/Rangi.sorted.bam \
/data/alignments_male/bam/sorted/Richard_Henry.sorted.bam \
/data/alignments_male/bam/sorted/Robbie.sorted.bam \
/data/alignments_male/bam/sorted/Ruapuke.sorted.bam \
/data/alignments_male/bam/sorted/Ruggedy.sorted.bam \
/data/alignments_male/bam/sorted/Sass.sorted.bam \
/data/alignments_male/bam/sorted/Scratch.sorted.bam \
/data/alignments_male/bam/sorted/Sinbad.sorted.bam \
/data/alignments_male/bam/sorted/Sirocco.sorted.bam \
/data/alignments_male/bam/sorted/Smoko.sorted.bam \
/data/alignments_male/bam/sorted/Stumpy.sorted.bam \
/data/alignments_male/bam/sorted/Taeatanga.sorted.bam \
/data/alignments_male/bam/sorted/Takitimu.sorted.bam \
/data/alignments_male/bam/sorted/Tamahou.sorted.bam \
/data/alignments_male/bam/sorted/Tau_Kuhurangi.sorted.bam \
/data/alignments_male/bam/sorted/Te_Atapo.sorted.bam \
/data/alignments_male/bam/sorted/Te_Awa.sorted.bam \
/data/alignments_male/bam/sorted/Te_Here.sorted.bam \
/data/alignments_male/bam/sorted/Te_Kingi.sorted.bam \
/data/alignments_male/bam/sorted/Tiwai.sorted.bam \
/data/alignments_male/bam/sorted/Trevor.sorted.bam \
/data/alignments_male/bam/sorted/Tuterangi.sorted.bam \
/data/alignments_male/bam/sorted/Tutoko.sorted.bam \
/data/alignments_male/bam/sorted/Waihopai.sorted.bam \
/data/alignments_male/bam/sorted/Waynebo.sorted.bam \
/data/alignments_male/bam/sorted/Wharetutu.sorted.bam \
/data/alignments_male/bam/sorted/Whiskas.sorted.bam \
/data/alignments_male/bam/sorted/Wiremu.sorted.bam \
/data/alignments_male/bam/sorted/Wolf.sorted.bam
