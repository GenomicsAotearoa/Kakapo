// Should do a proper split but this is quicker
/*Channel
	.fromPath("/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/03_Reference_SNPs/alignments/*.cram")
	.toList()
	.set { reads_all }

reads_all.subscribe { println it }*/
cram_location = "/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/03_Reference_SNPs/alignments/*.cram"

assembly = file("/scale_wlg_nobackup/filesets/nobackup/uoo02695/Kakapo/00_Assembly_Procedures/store/downloaded/assembly.fasta")

Channel
     .fromPath('missing_regions.txt')
     .splitText(by: 1)
     .map { [it.trim().replaceAll(":", "_"), it.trim()] }
     .set { regions_processed }

regions_processed.subscribe { println it }
