#!/bin/sh
#####################################################################################
#Creating a configuration file for Batch 01 of MANTA structural variant calling.
######################################################################################
manta=/scale_wlg_nobackup/filesets/nobackup/uoo02695/software/manta-1.6.0.centos6_x86_64/
input=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/alignments_male/bam/sorted/
jane=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/alignments_female/jane/jane_sim_noW.sorted.bam
output=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/manta/joint_calling/male/
ref=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/References/kakapo_no_Wchromosome.fa

${manta}/bin/configManta.py \
--bam ${jane} \
--bam ${input}Al.sorted.bam \
--bam ${input}Arab.sorted.bam \
--bam ${input}Ariki.sorted.bam \
--bam ${input}Attenborough.sorted.bam \
--bam ${input}Awhero.sorted.bam \
--bam ${input}Barnard.sorted.bam \
--bam ${input}Basil.sorted.bam \
--bam ${input}Ben.sorted.bam \
--bam ${input}Bill.sorted.bam \
--bam ${input}Blades.sorted.bam \
--bam ${input}Blake.sorted.bam \
--bam ${input}Bluster_Murphy.sorted.bam \
--bam ${input}Bonus.sorted.bam \
--bam ${input}Boss.sorted.bam \
--bam ${input}Clout.sorted.bam \
--bam ${input}Dobbie.sorted.bam \
--bam ${input}Doc.sorted.bam \
--bam ${input}Egilsay.sorted.bam \
--bam ${input}Elliot.sorted.bam \
--bam ${input}Elwin.sorted.bam \
--bam ${input}Faulkner.sorted.bam \
--bam ${input}Felix.sorted.bam \
--bam ${input}George.sorted.bam \
--bam ${input}Guapo.sorted.bam \
--bam ${input}Gulliver.sorted.bam \
--bam ${input}Gumboots.sorted.bam \
--bam ${input}Gunner.sorted.bam \
--bam ${input}Henry.sorted.bam \
--bam ${input}Hillary.sorted.bam \
--bam ${input}Hokonui.sorted.bam \
--bam ${input}Horton.sorted.bam \
--bam ${input}Hugh.sorted.bam \
--bam ${input}Hurihuri.sorted.bam \
--bam ${input}Ian.sorted.bam \
--bam ${input}Jack.sorted.bam \
--bam ${input}Jamieson.sorted.bam \
--bam ${input}Jester.sorted.bam \
--bam ${input}Jimmy.sorted.bam \
--bam ${input}Joe.sorted.bam \
--bam ${input}Juanma.sorted.bam \
--bam ${input}Kanawera.sorted.bam \
--bam ${input}Kokoto.sorted.bam \
--bam ${input}Komaru.sorted.bam \
--bam ${input}Konini_3-4-16.sorted.bam \
--bam ${input}Kotiu.sorted.bam \
--bam ${input}Kumi.sorted.bam \
--bam ${input}Lee.sorted.bam \
--bam ${input}Lionel.sorted.bam \
--bam ${input}Luke.sorted.bam \
--bam ${input}Manu.sorted.bam \
--bam ${input}Matangi.sorted.bam \
--bam ${input}Merty.sorted.bam \
--bam ${input}Merv.sorted.bam \
--bam ${input}Moorhouse.sorted.bam \
--bam ${input}Morehu.sorted.bam \
--bam ${input}Moss.sorted.bam \
--bam ${input}Ngatapa.sorted.bam \
--bam ${input}Nog.sorted.bam \
--bam ${input}Oraka.sorted.bam \
--bam ${input}Ox.sorted.bam \
--bam ${input}Paddy.sorted.bam \
--bam ${input}Palmersan.sorted.bam \
--bam ${input}Percy.sorted.bam \
--bam ${input}Piripi.sorted.bam \
--bam ${input}Ralph.sorted.bam \
--bam ${input}Rangi.sorted.bam \
--bam ${input}Richard_Henry.sorted.bam \
--bam ${input}Robbie.sorted.bam \
--bam ${input}Ruapuke.sorted.bam \
--bam ${input}Ruggedy.sorted.bam \
--bam ${input}Sass.sorted.bam \
--bam ${input}Scratch.sorted.bam \
--bam ${input}Sinbad.sorted.bam \
--bam ${input}Sirocco.sorted.bam \
--bam ${input}Smoko.sorted.bam \
--bam ${input}Stumpy.sorted.bam \
--bam ${input}Taeatanga.sorted.bam \
--bam ${input}Takitimu.sorted.bam \
--bam ${input}Tamahou.sorted.bam \
--bam ${input}Tau_Kuhurangi.sorted.bam \
--bam ${input}Te_Atapo.sorted.bam \
--bam ${input}Te_Awa.sorted.bam \
--bam ${input}Te_Here.sorted.bam \
--bam ${input}Te_Kingi.sorted.bam \
--bam ${input}Tiwai.sorted.bam \
--bam ${input}Trevor.sorted.bam \
--bam ${input}Tuterangi.sorted.bam \
--bam ${input}Tutoko.sorted.bam \
--bam ${input}Waihopai.sorted.bam \
--bam ${input}Waynebo.sorted.bam \
--bam ${input}Wharetutu.sorted.bam \
--bam ${input}Whiskas.sorted.bam \
--bam ${input}Wiremu.sorted.bam \
--bam ${input}Wolf.sorted.bam \
--referenceFasta ${ref} \
--runDir ${output}
