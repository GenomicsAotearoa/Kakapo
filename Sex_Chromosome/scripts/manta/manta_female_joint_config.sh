#!/bin/sh
#####################################################################################
#Creating a configuration file for Batch 01 of MANTA structural variant calling.
######################################################################################
manta=/scale_wlg_nobackup/filesets/nobackup/uoo02695/software/manta-1.6.0.centos6_x86_64/
input=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/alignments_female/bam/sorted/
jane=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/alignments_female/jane/jane_sim_sorted.bam
output=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/manta/female/joint_calling/female/
ref=/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/Sex_Chromosome/References/kakapo_full_ref.fa

${manta}/bin/configManta.py \
--bam ${jane} \
--bam ${input}Adelaide.sorted.bam \
--bam ${input}Alice.sorted.bam \
--bam ${input}Aparima.sorted.bam \
--bam ${input}Aranga.sorted.bam \
--bam ${input}Atareta.sorted.bam \
--bam ${input}Aumaria.sorted.bam \
--bam ${input}Awarua.sorted.bam \
--bam ${input}Bella.sorted.bam \
--bam ${input}Boomer.sorted.bam \
--bam ${input}Cyndy.sorted.bam \
--bam ${input}Dusky.sorted.bam \
--bam ${input}Ellie.sorted.bam \
--bam ${input}Esperance.sorted.bam \
--bam ${input}Evohe.sorted.bam \
--bam ${input}Flossie.sorted.bam \
--bam ${input}Fuchsia.sorted.bam \
--bam ${input}Gertrude.sorted.bam \
--bam ${input}Hakatere.sorted.bam \
--bam ${input}Hananui.sorted.bam \
--bam ${input}Hauturu.sorted.bam \
--bam ${input}Heather.sorted.bam \
--bam ${input}Hera.sorted.bam \
--bam ${input}Hinemoa.sorted.bam \
--bam ${input}Hine_Taumai.sorted.bam \
--bam ${input}Hoki.sorted.bam \
--bam ${input}Huhana.sorted.bam \
--bam ${input}Ihi.sorted.bam \
--bam ${input}Jean.sorted.bam \
--bam ${input}Jemma.sorted.bam \
--bam ${input}JEM.sorted.bam \
--bam ${input}Konini.sorted.bam \
--bam ${input}Kuia.sorted.bam \
--bam ${input}Kuihi.sorted.bam \
--bam ${input}Kura.sorted.bam \
--bam ${input}Lisa.sorted.bam \
--bam ${input}Maggie.sorted.bam \
--bam ${input}Mahli.sorted.bam \
--bam ${input}Makorea.sorted.bam \
--bam ${input}Marama.sorted.bam \
--bam ${input}Margaret-Maree.sorted.bam \
--bam ${input}Marian.sorted.bam \
--bam ${input}Mila.sorted.bam \
--bam ${input}Millie.sorted.bam \
--bam ${input}Mukeke.sorted.bam \
--bam ${input}Ninihi.sorted.bam \
--bam ${input}Nora.sorted.bam \
--bam ${input}Pearl.sorted.bam \
--bam ${input}Pounamu.sorted.bam \
--bam ${input}Pura.sorted.bam \
--bam ${input}Queenie.sorted.bam \
--bam ${input}Ra.sorted.bam \
--bam ${input}Rakiura.sorted.bam \
--bam ${input}Rimu.sorted.bam \
--bam ${input}Roha.sorted.bam \
--bam ${input}Ruth.sorted.bam \
--bam ${input}Sandra.sorted.bam \
--bam ${input}Sarah.sorted.bam \
--bam ${input}Solstice.sorted.bam \
--bam ${input}Stella.sorted.bam \
--bam ${input}Sue.sorted.bam \
--bam ${input}Suzanne.sorted.bam \
--bam ${input}Tia.sorted.bam \
--bam ${input}Tiaka.sorted.bam \
--bam ${input}Titapu.sorted.bam \
--bam ${input}Tiwhiri.sorted.bam \
--bam ${input}Tohu.sorted.bam \
--bam ${input}Toitiiti.sorted.bam \
--bam ${input}Tukaha.sorted.bam \
--bam ${input}Tumeke.sorted.bam \
--bam ${input}Waa.sorted.bam \
--bam ${input}Waikawa.sorted.bam \
--bam ${input}Weheruatanga-o-te-po.sorted.bam \
--bam ${input}Wendy.sorted.bam \
--bam ${input}Yasmine.sorted.bam \
--bam ${input}Zephyr.sorted.bam \
--referenceFasta ${ref} \
--runDir ${output}
