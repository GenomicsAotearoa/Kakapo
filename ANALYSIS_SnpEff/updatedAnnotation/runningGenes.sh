#!/bin/bash

grep "gene=;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/Mod_GCF_004027225.2_bStrHab1.2.pri_genomic.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_.gff
grep -v "gene=;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/Mod_GCF_004027225.2_bStrHab1.2.pri_genomic.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_.gff

grep "gene=ABT1;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_ABT1.gff
grep -v "gene=ABT1;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=ABT1;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_ABT1.gff

grep "gene=ADARB1;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_ADARB1.gff
grep -v "gene=ADARB1;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=ADARB1;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_ADARB1.gff

grep "gene=AGMO;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_AGMO.gff
grep -v "gene=AGMO;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=AGMO;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_AGMO.gff

grep "gene=AP5M1;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_AP5M1.gff
grep -v "gene=AP5M1;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=AP5M1;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_AP5M1.gff

grep "gene=ATXN2L;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_ATXN2L.gff
grep -v "gene=ATXN2L;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=ATXN2L;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_ATXN2L.gff

grep "gene=C10H1orf100;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_C10H1orf100.gff
grep -v "gene=C10H1orf100;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=C10H1orf100;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_C10H1orf100.gff

grep "gene=C4H14orf180;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_C4H14orf180.gff
grep -v "gene=C4H14orf180;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=C4H14orf180;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_C4H14orf180.gff

grep "gene=C9H15orf65;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_C9H15orf65.gff
grep -v "gene=C9H15orf65;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=C9H15orf65;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_C9H15orf65.gff

grep "gene=CCDC120;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_CCDC120.gff
grep -v "gene=CCDC120;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=CCDC120;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_CCDC120.gff

grep "gene=COG8;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_COG8.gff
grep -v "gene=COG8;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=COG8;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_COG8.gff

grep "gene=COL11A2;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_COL11A2.gff
grep -v "gene=COL11A2;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=COL11A2;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_COL11A2.gff

grep "gene=CUNH2orf68_circ;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_CUNH2orf68_circ.gff
grep -v "gene=CUNH2orf68_circ;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=CUNH2orf68_circ;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_CUNH2orf68_circ.gff

grep "gene=DDR1;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_DDR1.gff
grep -v "gene=DDR1;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=DDR1;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_DDR1.gff

grep "gene=DHRS9;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_DHRS9.gff
grep -v "gene=DHRS9;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=DHRS9;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_DHRS9.gff

grep "gene=DIO2;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_DIO2.gff
grep -v "gene=DIO2;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=DIO2;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_DIO2.gff

grep "gene=DNAH11;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_DNAH11.gff
grep -v "gene=DNAH11;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=DNAH11;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_DNAH11.gff

grep "gene=DNAH8;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_DNAH8.gff
grep -v "gene=DNAH8;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=DNAH8;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_DNAH8.gff

grep "gene=ESPL1;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_ESPL1.gff
grep -v "gene=ESPL1;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=ESPL1;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_ESPL1.gff

grep "gene=FBXO10;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_FBXO10.gff
grep -v "gene=FBXO10;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=FBXO10;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_FBXO10.gff

grep "gene=FETUB;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_FETUB.gff
grep -v "gene=FETUB;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=FETUB;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_FETUB.gff

grep "gene=FIBP;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_FIBP.gff
grep -v "gene=FIBP;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=FIBP;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_FIBP.gff

grep "gene=FRAS1;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_FRAS1.gff
grep -v "gene=FRAS1;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=FRAS1;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_FRAS1.gff

grep "gene=FRMD8;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_FRMD8.gff
grep -v "gene=FRMD8;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=FRMD8;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_FRMD8.gff

grep "gene=GHRL;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_GHRL.gff
grep -v "gene=GHRL;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=GHRL;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_GHRL.gff

grep "gene=GMNC;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_GMNC.gff
grep -v "gene=GMNC;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=GMNC;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_GMNC.gff

grep "gene=HYAL4;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_HYAL4.gff
grep -v "gene=HYAL4;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=HYAL4;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_HYAL4.gff

grep "gene=IL34;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_IL34.gff
grep -v "gene=IL34;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=IL34;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_IL34.gff

grep "gene=ITPRIPL2;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_ITPRIPL2.gff
grep -v "gene=ITPRIPL2;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=ITPRIPL2;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_ITPRIPL2.gff

grep "gene=KHSRP;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_KHSRP.gff
grep -v "gene=KHSRP;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=KHSRP;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_KHSRP.gff

grep "gene=LAMC2;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LAMC2.gff
grep -v "gene=LAMC2;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=LAMC2;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LAMC2.gff

grep "gene=LOC115601017;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115601017.gff
grep -v "gene=LOC115601017;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=LOC115601017;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115601017.gff

grep "gene=LOC115601704;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115601704.gff
grep -v "gene=LOC115601704;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=LOC115601704;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115601704.gff

grep "gene=LOC115602104;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115602104.gff
grep -v "gene=LOC115602104;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=LOC115602104;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115602104.gff

grep "gene=LOC115602828;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115602828.gff
grep -v "gene=LOC115602828;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=LOC115602828;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115602828.gff

grep "gene=LOC115602847;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115602847.gff
grep -v "gene=LOC115602847;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=LOC115602847;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115602847.gff

grep "gene=LOC115602887;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115602887.gff
grep -v "gene=LOC115602887;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=LOC115602887;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115602887.gff

grep "gene=LOC115602966;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115602966.gff
grep -v "gene=LOC115602966;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=LOC115602966;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115602966.gff

grep "gene=LOC115602998;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115602998.gff
grep -v "gene=LOC115602998;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=LOC115602998;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115602998.gff

grep "gene=LOC115603005;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115603005.gff
grep -v "gene=LOC115603005;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=LOC115603005;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115603005.gff

grep "gene=LOC115603008;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115603008.gff
grep -v "gene=LOC115603008;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=LOC115603008;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115603008.gff

grep "gene=LOC115603046;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115603046.gff
grep -v "gene=LOC115603046;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=LOC115603046;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115603046.gff

grep "gene=LOC115603047;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115603047.gff
grep -v "gene=LOC115603047;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=LOC115603047;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115603047.gff

grep "gene=LOC115603052;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115603052.gff
grep -v "gene=LOC115603052;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=LOC115603052;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115603052.gff

grep "gene=LOC115603101;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115603101.gff
grep -v "gene=LOC115603101;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=LOC115603101;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115603101.gff

grep "gene=LOC115603158;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115603158.gff
grep -v "gene=LOC115603158;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=LOC115603158;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115603158.gff

grep "gene=LOC115603159;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115603159.gff
grep -v "gene=LOC115603159;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=LOC115603159;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115603159.gff

grep "gene=LOC115603204;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115603204.gff
grep -v "gene=LOC115603204;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=LOC115603204;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115603204.gff

grep "gene=LOC115603208;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115603208.gff
grep -v "gene=LOC115603208;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=LOC115603208;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115603208.gff

grep "gene=LOC115603282;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115603282.gff
grep -v "gene=LOC115603282;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=LOC115603282;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115603282.gff

grep "gene=LOC115603283;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115603283.gff
grep -v "gene=LOC115603283;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=LOC115603283;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115603283.gff

grep "gene=LOC115603284;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115603284.gff
grep -v "gene=LOC115603284;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=LOC115603284;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115603284.gff

grep "gene=LOC115603285;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115603285.gff
grep -v "gene=LOC115603285;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=LOC115603285;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115603285.gff

grep "gene=LOC115603286;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115603286.gff
grep -v "gene=LOC115603286;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=LOC115603286;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115603286.gff

grep "gene=LOC115603288;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115603288.gff
grep -v "gene=LOC115603288;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=LOC115603288;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115603288.gff

grep "gene=LOC115603289;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115603289.gff
grep -v "gene=LOC115603289;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=LOC115603289;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115603289.gff

grep "gene=LOC115603290;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115603290.gff
grep -v "gene=LOC115603290;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=LOC115603290;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115603290.gff

grep "gene=LOC115603291;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115603291.gff
grep -v "gene=LOC115603291;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=LOC115603291;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115603291.gff

grep "gene=LOC115603292;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115603292.gff
grep -v "gene=LOC115603292;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=LOC115603292;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115603292.gff

grep "gene=LOC115603293;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115603293.gff
grep -v "gene=LOC115603293;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=LOC115603293;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115603293.gff

grep "gene=LOC115603294;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115603294.gff
grep -v "gene=LOC115603294;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=LOC115603294;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115603294.gff

grep "gene=LOC115603295;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115603295.gff
grep -v "gene=LOC115603295;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=LOC115603295;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115603295.gff

grep "gene=LOC115603296;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115603296.gff
grep -v "gene=LOC115603296;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=LOC115603296;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115603296.gff

grep "gene=LOC115603297;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115603297.gff
grep -v "gene=LOC115603297;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=LOC115603297;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115603297.gff

grep "gene=LOC115603298;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115603298.gff
grep -v "gene=LOC115603298;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=LOC115603298;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115603298.gff

grep "gene=LOC115603299;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115603299.gff
grep -v "gene=LOC115603299;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=LOC115603299;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115603299.gff

grep "gene=LOC115603300;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115603300.gff
grep -v "gene=LOC115603300;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=LOC115603300;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115603300.gff

grep "gene=LOC115603301;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115603301.gff
grep -v "gene=LOC115603301;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=LOC115603301;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115603301.gff

grep "gene=LOC115603302;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115603302.gff
grep -v "gene=LOC115603302;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=LOC115603302;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115603302.gff

grep "gene=LOC115603314;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115603314.gff
grep -v "gene=LOC115603314;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=LOC115603314;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115603314.gff

grep "gene=LOC115603320;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115603320.gff
grep -v "gene=LOC115603320;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=LOC115603320;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115603320.gff

grep "gene=LOC115603367;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115603367.gff
grep -v "gene=LOC115603367;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=LOC115603367;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115603367.gff

grep "gene=LOC115603447;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115603447.gff
grep -v "gene=LOC115603447;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=LOC115603447;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115603447.gff

grep "gene=LOC115603536;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115603536.gff
grep -v "gene=LOC115603536;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=LOC115603536;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115603536.gff

grep "gene=LOC115604079;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115604079.gff
grep -v "gene=LOC115604079;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=LOC115604079;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115604079.gff

grep "gene=LOC115604085;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115604085.gff
grep -v "gene=LOC115604085;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=LOC115604085;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115604085.gff

grep "gene=LOC115604473;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115604473.gff
grep -v "gene=LOC115604473;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=LOC115604473;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115604473.gff

grep "gene=LOC115605316;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115605316.gff
grep -v "gene=LOC115605316;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=LOC115605316;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115605316.gff

grep "gene=LOC115605327;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115605327.gff
grep -v "gene=LOC115605327;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=LOC115605327;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115605327.gff

grep "gene=LOC115605360;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115605360.gff
grep -v "gene=LOC115605360;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=LOC115605360;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115605360.gff

grep "gene=LOC115606225;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115606225.gff
grep -v "gene=LOC115606225;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=LOC115606225;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115606225.gff

grep "gene=LOC115606225_circ;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115606225_circ.gff
grep -v "gene=LOC115606225_circ;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=LOC115606225_circ;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115606225_circ.gff

grep "gene=LOC115606427;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115606427.gff
grep -v "gene=LOC115606427;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=LOC115606427;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115606427.gff

grep "gene=LOC115607533;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115607533.gff
grep -v "gene=LOC115607533;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=LOC115607533;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115607533.gff

grep "gene=LOC115608762;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115608762.gff
grep -v "gene=LOC115608762;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=LOC115608762;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115608762.gff

grep "gene=LOC115608763;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115608763.gff
grep -v "gene=LOC115608763;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=LOC115608763;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115608763.gff

grep "gene=LOC115609314;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115609314.gff
grep -v "gene=LOC115609314;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=LOC115609314;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115609314.gff

grep "gene=LOC115609468;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115609468.gff
grep -v "gene=LOC115609468;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=LOC115609468;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115609468.gff

grep "gene=LOC115610106;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115610106.gff
grep -v "gene=LOC115610106;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=LOC115610106;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115610106.gff

grep "gene=LOC115610119;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115610119.gff
grep -v "gene=LOC115610119;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=LOC115610119;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115610119.gff

grep "gene=LOC115610783;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115610783.gff
grep -v "gene=LOC115610783;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=LOC115610783;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115610783.gff

grep "gene=LOC115611198;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115611198.gff
grep -v "gene=LOC115611198;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=LOC115611198;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115611198.gff

grep "gene=LOC115611643;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115611643.gff
grep -v "gene=LOC115611643;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=LOC115611643;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115611643.gff

grep "gene=LOC115614361;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115614361.gff
grep -v "gene=LOC115614361;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=LOC115614361;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115614361.gff

grep "gene=LOC115614485;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115614485.gff
grep -v "gene=LOC115614485;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=LOC115614485;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115614485.gff

grep "gene=LOC115614573;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115614573.gff
grep -v "gene=LOC115614573;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=LOC115614573;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115614573.gff

grep "gene=LOC115615360;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115615360.gff
grep -v "gene=LOC115615360;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=LOC115615360;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115615360.gff

grep "gene=LOC115617122;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115617122.gff
grep -v "gene=LOC115617122;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=LOC115617122;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115617122.gff

grep "gene=LOC115617696;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115617696.gff
grep -v "gene=LOC115617696;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=LOC115617696;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115617696.gff

grep "gene=LOC115617697;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115617697.gff
grep -v "gene=LOC115617697;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=LOC115617697;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115617697.gff

grep "gene=LOC115617703;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115617703.gff
grep -v "gene=LOC115617703;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=LOC115617703;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115617703.gff

grep "gene=LOC115617706;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115617706.gff
grep -v "gene=LOC115617706;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=LOC115617706;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115617706.gff

grep "gene=LOC115617708;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115617708.gff
grep -v "gene=LOC115617708;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=LOC115617708;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115617708.gff

grep "gene=LOC115617712;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115617712.gff
grep -v "gene=LOC115617712;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=LOC115617712;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115617712.gff

grep "gene=LOC115617714;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115617714.gff
grep -v "gene=LOC115617714;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=LOC115617714;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115617714.gff

grep "gene=LOC115618621;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115618621.gff
grep -v "gene=LOC115618621;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=LOC115618621;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115618621.gff

grep "gene=LOC115618791;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115618791.gff
grep -v "gene=LOC115618791;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=LOC115618791;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115618791.gff

grep "gene=LOC115618915;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115618915.gff
grep -v "gene=LOC115618915;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=LOC115618915;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115618915.gff

grep "gene=LOC115618920;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115618920.gff
grep -v "gene=LOC115618920;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=LOC115618920;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115618920.gff

grep "gene=LOC115618964;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115618964.gff
grep -v "gene=LOC115618964;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=LOC115618964;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115618964.gff

grep "gene=LOC115618994;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115618994.gff
grep -v "gene=LOC115618994;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=LOC115618994;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115618994.gff

grep "gene=LOC115618996;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115618996.gff
grep -v "gene=LOC115618996;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=LOC115618996;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115618996.gff

grep "gene=LOC115619025;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115619025.gff
grep -v "gene=LOC115619025;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=LOC115619025;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115619025.gff

grep "gene=LOC115619171;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115619171.gff
grep -v "gene=LOC115619171;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=LOC115619171;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115619171.gff

grep "gene=LOC115619255;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115619255.gff
grep -v "gene=LOC115619255;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=LOC115619255;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115619255.gff

grep "gene=LOC115619267;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115619267.gff
grep -v "gene=LOC115619267;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=LOC115619267;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115619267.gff

grep "gene=LOC115619277;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115619277.gff
grep -v "gene=LOC115619277;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=LOC115619277;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115619277.gff

grep "gene=LOC115619291;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115619291.gff
grep -v "gene=LOC115619291;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=LOC115619291;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115619291.gff

grep "gene=LOC115619298;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115619298.gff
grep -v "gene=LOC115619298;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=LOC115619298;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115619298.gff

grep "gene=LOC116915278;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC116915278.gff
grep -v "gene=LOC116915278;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=LOC116915278;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC116915278.gff

grep "gene=LRRIQ4;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LRRIQ4.gff
grep -v "gene=LRRIQ4;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=LRRIQ4;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LRRIQ4.gff

grep "gene=LTBP4;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LTBP4.gff
grep -v "gene=LTBP4;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=LTBP4;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LTBP4.gff

grep "gene=MAG;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_MAG.gff
grep -v "gene=MAG;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=MAG;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_MAG.gff

grep "gene=MAK;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_MAK.gff
grep -v "gene=MAK;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=MAK;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_MAK.gff

grep "gene=MGAT5;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_MGAT5.gff
grep -v "gene=MGAT5;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=MGAT5;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_MGAT5.gff

grep "gene=MOK;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_MOK.gff
grep -v "gene=MOK;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=MOK;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_MOK.gff

grep "gene=NIP7;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_NIP7.gff
grep -v "gene=NIP7;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=NIP7;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_NIP7.gff

grep "gene=NLRC5;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_NLRC5.gff
grep -v "gene=NLRC5;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=NLRC5;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_NLRC5.gff

grep "gene=NWD1;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_NWD1.gff
grep -v "gene=NWD1;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=NWD1;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_NWD1.gff

grep "gene=OBSCN;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_OBSCN.gff
grep -v "gene=OBSCN;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=OBSCN;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_OBSCN.gff

grep "gene=OTUB1;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_OTUB1.gff
grep -v "gene=OTUB1;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=OTUB1;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_OTUB1.gff

grep "gene=PCNT;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_PCNT.gff
grep -v "gene=PCNT;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=PCNT;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_PCNT.gff

grep "gene=PDCD1LG2;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_PDCD1LG2.gff
grep -v "gene=PDCD1LG2;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=PDCD1LG2;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_PDCD1LG2.gff

grep "gene=PDE7B;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_PDE7B.gff
grep -v "gene=PDE7B;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=PDE7B;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_PDE7B.gff

grep "gene=PDZRN4;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_PDZRN4.gff
grep -v "gene=PDZRN4;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=PDZRN4;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_PDZRN4.gff

grep "gene=PLP2;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_PLP2.gff
grep -v "gene=PLP2;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=PLP2;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_PLP2.gff

grep "gene=PP2D1;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_PP2D1.gff
grep -v "gene=PP2D1;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=PP2D1;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_PP2D1.gff

grep "gene=PTCD2;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_PTCD2.gff
grep -v "gene=PTCD2;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=PTCD2;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_PTCD2.gff

grep "gene=RAB36;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_RAB36.gff
grep -v "gene=RAB36;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=RAB36;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_RAB36.gff

grep "gene=REP15;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_REP15.gff
grep -v "gene=REP15;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=REP15;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_REP15.gff

grep "gene=RNF146;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_RNF146.gff
grep -v "gene=RNF146;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=RNF146;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_RNF146.gff

grep "gene=RNF175;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_RNF175.gff
grep -v "gene=RNF175;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=RNF175;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_RNF175.gff

grep "gene=RNF32;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_RNF32.gff
grep -v "gene=RNF32;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=RNF32;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_RNF32.gff

grep "gene=RPUSD2;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_RPUSD2.gff
grep -v "gene=RPUSD2;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=RPUSD2;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_RPUSD2.gff

grep "gene=RSRC1;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_RSRC1.gff
grep -v "gene=RSRC1;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=RSRC1;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_RSRC1.gff

grep "gene=SART1;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_SART1.gff
grep -v "gene=SART1;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=SART1;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_SART1.gff

grep "gene=SELENOP;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_SELENOP.gff
grep -v "gene=SELENOP;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=SELENOP;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_SELENOP.gff

grep "gene=SLC33A1;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_SLC33A1.gff
grep -v "gene=SLC33A1;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=SLC33A1;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_SLC33A1.gff

grep "gene=SNTB2;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_SNTB2.gff
grep -v "gene=SNTB2;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=SNTB2;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_SNTB2.gff

grep "gene=SPATA48;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_SPATA48.gff
grep -v "gene=SPATA48;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=SPATA48;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_SPATA48.gff

grep "gene=SPTBN5;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_SPTBN5.gff
grep -v "gene=SPTBN5;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=SPTBN5;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_SPTBN5.gff

grep "gene=STK19;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_STK19.gff
grep -v "gene=STK19;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=STK19;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_STK19.gff

grep "gene=TACSTD2;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_TACSTD2.gff
grep -v "gene=TACSTD2;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=TACSTD2;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_TACSTD2.gff

grep "gene=TAF1C;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_TAF1C.gff
grep -v "gene=TAF1C;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=TAF1C;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_TAF1C.gff

grep "gene=TARS2;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_TARS2.gff
grep -v "gene=TARS2;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=TARS2;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_TARS2.gff

grep "gene=TCP11;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_TCP11.gff
grep -v "gene=TCP11;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=TCP11;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_TCP11.gff

grep "gene=THOC1;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_THOC1.gff
grep -v "gene=THOC1;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=THOC1;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_THOC1.gff

grep "gene=TNNT3;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_TNNT3.gff
grep -v "gene=TNNT3;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=TNNT3;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_TNNT3.gff

grep "gene=TPO;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_TPO.gff
grep -v "gene=TPO;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=TPO;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_TPO.gff

grep "gene=TRIM14;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_TRIM14.gff
grep -v "gene=TRIM14;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=TRIM14;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_TRIM14.gff

grep "gene=USP39;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_USP39.gff
grep -v "gene=USP39;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=USP39;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_USP39.gff

grep "gene=VARS1;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_VARS1.gff
grep -v "gene=VARS1;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=VARS1;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_VARS1.gff

grep "gene=WDR46;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_WDR46.gff
grep -v "gene=WDR46;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=WDR46;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_WDR46.gff

grep "gene=WDR62;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_WDR62.gff
grep -v "gene=WDR62;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=WDR62;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_WDR62.gff

grep "gene=WDR72;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_WDR72.gff
grep -v "gene=WDR72;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=WDR72;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_WDR72.gff

grep "gene=WNT9B;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_WNT9B.gff
grep -v "gene=WNT9B;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=WNT9B;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_WNT9B.gff

grep "gene=ZC3H12A;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_ZC3H12A.gff
grep -v "gene=ZC3H12A;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=ZC3H12A;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_ZC3H12A.gff

grep "gene=ZNF407;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_ZNF407.gff
grep -v "gene=ZNF407;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=ZNF407;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_ZNF407.gff

grep "gene=ZNF469;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_ZNF469.gff
grep -v "gene=ZNF469;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=ZNF469;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_ZNF469.gff

grep "gene=ZNF865;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_ZNF865.gff
grep -v "gene=ZNF865;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff
grep "gene=ZNF865;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_ZNF865.gff

grep "gene=ZNHIT1;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_ZNHIT1.gff
grep -v "gene=ZNHIT1;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gff > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/attempt4Long/Clean_GCF_004027225.2_bStrHab1.2.pri_genomic.gff
grep "gene=ZNHIT1;" /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/attempt4Long/Clean_GCF_004027225.2_bStrHab1.2.pri_genomic.gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_ZNHIT1.gff

sed -n '/gene ""/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/Mod_GCF_004027225.2_bStrHab1.2.pri_genomic.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_.gtf
sed -n '/gene ""/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/Mod_GCF_004027225.2_bStrHab1.2.pri_genomic.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene ""/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_.gtf

sed -n '/gene "ABT1"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_ABT1.gtf
sed -n '/gene "ABT1"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "ABT1"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_ABT1.gtf

sed -n '/gene "ADARB1"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_ADARB1.gtf
sed -n '/gene "ADARB1"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "ADARB1"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_ADARB1.gtf

sed -n '/gene "AGMO"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_AGMO.gtf
sed -n '/gene "AGMO"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "AGMO"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_AGMO.gtf

sed -n '/gene "AP5M1"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_AP5M1.gtf
sed -n '/gene "AP5M1"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "AP5M1"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_AP5M1.gtf

sed -n '/gene "ATXN2L"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_ATXN2L.gtf
sed -n '/gene "ATXN2L"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "ATXN2L"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_ATXN2L.gtf

sed -n '/gene "C10H1orf100"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_C10H1orf100.gtf
sed -n '/gene "C10H1orf100"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "C10H1orf100"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_C10H1orf100.gtf

sed -n '/gene "C4H14orf180"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_C4H14orf180.gtf
sed -n '/gene "C4H14orf180"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "C4H14orf180"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_C4H14orf180.gtf

sed -n '/gene "C9H15orf65"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_C9H15orf65.gtf
sed -n '/gene "C9H15orf65"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "C9H15orf65"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_C9H15orf65.gtf

sed -n '/gene "CCDC120"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_CCDC120.gtf
sed -n '/gene "CCDC120"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "CCDC120"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_CCDC120.gtf

sed -n '/gene "COG8"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_COG8.gtf
sed -n '/gene "COG8"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "COG8"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_COG8.gtf

sed -n '/gene "COL11A2"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_COL11A2.gtf
sed -n '/gene "COL11A2"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "COL11A2"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_COL11A2.gtf

sed -n '/gene "CUNH2orf68_circ"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_CUNH2orf68_circ.gtf
sed -n '/gene "CUNH2orf68_circ"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "CUNH2orf68_circ"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_CUNH2orf68_circ.gtf

sed -n '/gene "DDR1"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_DDR1.gtf
sed -n '/gene "DDR1"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "DDR1"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_DDR1.gtf

sed -n '/gene "DHRS9"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_DHRS9.gtf
sed -n '/gene "DHRS9"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "DHRS9"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_DHRS9.gtf

sed -n '/gene "DIO2"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_DIO2.gtf
sed -n '/gene "DIO2"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "DIO2"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_DIO2.gtf

sed -n '/gene "DNAH11"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_DNAH11.gtf
sed -n '/gene "DNAH11"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "DNAH11"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_DNAH11.gtf

sed -n '/gene "DNAH8"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_DNAH8.gtf
sed -n '/gene "DNAH8"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "DNAH8"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_DNAH8.gtf

sed -n '/gene "ESPL1"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_ESPL1.gtf
sed -n '/gene "ESPL1"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "ESPL1"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_ESPL1.gtf

sed -n '/gene "FBXO10"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_FBXO10.gtf
sed -n '/gene "FBXO10"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "FBXO10"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_FBXO10.gtf

sed -n '/gene "FETUB"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_FETUB.gtf
sed -n '/gene "FETUB"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "FETUB"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_FETUB.gtf

sed -n '/gene "FIBP"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_FIBP.gtf
sed -n '/gene "FIBP"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "FIBP"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_FIBP.gtf

sed -n '/gene "FRAS1"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_FRAS1.gtf
sed -n '/gene "FRAS1"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "FRAS1"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_FRAS1.gtf

sed -n '/gene "FRMD8"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_FRMD8.gtf
sed -n '/gene "FRMD8"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "FRMD8"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_FRMD8.gtf

sed -n '/gene "GHRL"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_GHRL.gtf
sed -n '/gene "GHRL"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "GHRL"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_GHRL.gtf

sed -n '/gene "GMNC"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_GMNC.gtf
sed -n '/gene "GMNC"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "GMNC"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_GMNC.gtf

sed -n '/gene "HYAL4"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_HYAL4.gtf
sed -n '/gene "HYAL4"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "HYAL4"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_HYAL4.gtf

sed -n '/gene "IL34"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_IL34.gtf
sed -n '/gene "IL34"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "IL34"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_IL34.gtf

sed -n '/gene "ITPRIPL2"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_ITPRIPL2.gtf
sed -n '/gene "ITPRIPL2"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "ITPRIPL2"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_ITPRIPL2.gtf

sed -n '/gene "KHSRP"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_KHSRP.gtf
sed -n '/gene "KHSRP"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "KHSRP"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_KHSRP.gtf

sed -n '/gene "LAMC2"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LAMC2.gtf
sed -n '/gene "LAMC2"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "LAMC2"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LAMC2.gtf

sed -n '/gene "LOC115601017"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115601017.gtf
sed -n '/gene "LOC115601017"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "LOC115601017"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115601017.gtf

sed -n '/gene "LOC115601704"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115601704.gtf
sed -n '/gene "LOC115601704"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "LOC115601704"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115601704.gtf

sed -n '/gene "LOC115602104"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115602104.gtf
sed -n '/gene "LOC115602104"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "LOC115602104"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115602104.gtf

sed -n '/gene "LOC115602828"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115602828.gtf
sed -n '/gene "LOC115602828"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "LOC115602828"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115602828.gtf

sed -n '/gene "LOC115602847"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115602847.gtf
sed -n '/gene "LOC115602847"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "LOC115602847"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115602847.gtf

sed -n '/gene "LOC115602887"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115602887.gtf
sed -n '/gene "LOC115602887"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "LOC115602887"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115602887.gtf

sed -n '/gene "LOC115602966"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115602966.gtf
sed -n '/gene "LOC115602966"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "LOC115602966"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115602966.gtf

sed -n '/gene "LOC115602998"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115602998.gtf
sed -n '/gene "LOC115602998"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "LOC115602998"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115602998.gtf

sed -n '/gene "LOC115603005"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115603005.gtf
sed -n '/gene "LOC115603005"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "LOC115603005"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115603005.gtf

sed -n '/gene "LOC115603008"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115603008.gtf
sed -n '/gene "LOC115603008"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "LOC115603008"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115603008.gtf

sed -n '/gene "LOC115603046"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115603046.gtf
sed -n '/gene "LOC115603046"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "LOC115603046"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115603046.gtf

sed -n '/gene "LOC115603047"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115603047.gtf
sed -n '/gene "LOC115603047"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "LOC115603047"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115603047.gtf

sed -n '/gene "LOC115603052"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115603052.gtf
sed -n '/gene "LOC115603052"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "LOC115603052"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115603052.gtf

sed -n '/gene "LOC115603101"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115603101.gtf
sed -n '/gene "LOC115603101"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "LOC115603101"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115603101.gtf

sed -n '/gene "LOC115603158"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115603158.gtf
sed -n '/gene "LOC115603158"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "LOC115603158"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115603158.gtf

sed -n '/gene "LOC115603159"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115603159.gtf
sed -n '/gene "LOC115603159"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "LOC115603159"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115603159.gtf

sed -n '/gene "LOC115603204"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115603204.gtf
sed -n '/gene "LOC115603204"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "LOC115603204"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115603204.gtf

sed -n '/gene "LOC115603208"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115603208.gtf
sed -n '/gene "LOC115603208"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "LOC115603208"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115603208.gtf

sed -n '/gene "LOC115603282"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115603282.gtf
sed -n '/gene "LOC115603282"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "LOC115603282"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115603282.gtf

sed -n '/gene "LOC115603283"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115603283.gtf
sed -n '/gene "LOC115603283"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "LOC115603283"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115603283.gtf

sed -n '/gene "LOC115603284"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115603284.gtf
sed -n '/gene "LOC115603284"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "LOC115603284"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115603284.gtf

sed -n '/gene "LOC115603285"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115603285.gtf
sed -n '/gene "LOC115603285"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "LOC115603285"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115603285.gtf

sed -n '/gene "LOC115603286"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115603286.gtf
sed -n '/gene "LOC115603286"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "LOC115603286"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115603286.gtf

sed -n '/gene "LOC115603288"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115603288.gtf
sed -n '/gene "LOC115603288"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "LOC115603288"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115603288.gtf

sed -n '/gene "LOC115603289"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115603289.gtf
sed -n '/gene "LOC115603289"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "LOC115603289"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115603289.gtf

sed -n '/gene "LOC115603290"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115603290.gtf
sed -n '/gene "LOC115603290"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "LOC115603290"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115603290.gtf

sed -n '/gene "LOC115603291"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115603291.gtf
sed -n '/gene "LOC115603291"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "LOC115603291"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115603291.gtf

sed -n '/gene "LOC115603292"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115603292.gtf
sed -n '/gene "LOC115603292"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "LOC115603292"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115603292.gtf

sed -n '/gene "LOC115603293"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115603293.gtf
sed -n '/gene "LOC115603293"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "LOC115603293"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115603293.gtf

sed -n '/gene "LOC115603294"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115603294.gtf
sed -n '/gene "LOC115603294"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "LOC115603294"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115603294.gtf

sed -n '/gene "LOC115603295"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115603295.gtf
sed -n '/gene "LOC115603295"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "LOC115603295"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115603295.gtf

sed -n '/gene "LOC115603296"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115603296.gtf
sed -n '/gene "LOC115603296"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "LOC115603296"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115603296.gtf

sed -n '/gene "LOC115603297"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115603297.gtf
sed -n '/gene "LOC115603297"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "LOC115603297"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115603297.gtf

sed -n '/gene "LOC115603298"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115603298.gtf
sed -n '/gene "LOC115603298"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "LOC115603298"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115603298.gtf

sed -n '/gene "LOC115603299"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115603299.gtf
sed -n '/gene "LOC115603299"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "LOC115603299"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115603299.gtf

sed -n '/gene "LOC115603300"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115603300.gtf
sed -n '/gene "LOC115603300"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "LOC115603300"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115603300.gtf

sed -n '/gene "LOC115603301"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115603301.gtf
sed -n '/gene "LOC115603301"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "LOC115603301"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115603301.gtf

sed -n '/gene "LOC115603302"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115603302.gtf
sed -n '/gene "LOC115603302"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "LOC115603302"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115603302.gtf

sed -n '/gene "LOC115603314"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115603314.gtf
sed -n '/gene "LOC115603314"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "LOC115603314"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115603314.gtf

sed -n '/gene "LOC115603320"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115603320.gtf
sed -n '/gene "LOC115603320"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "LOC115603320"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115603320.gtf

sed -n '/gene "LOC115603367"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115603367.gtf
sed -n '/gene "LOC115603367"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "LOC115603367"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115603367.gtf

sed -n '/gene "LOC115603447"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115603447.gtf
sed -n '/gene "LOC115603447"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "LOC115603447"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115603447.gtf

sed -n '/gene "LOC115603536"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115603536.gtf
sed -n '/gene "LOC115603536"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "LOC115603536"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115603536.gtf

sed -n '/gene "LOC115604079"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115604079.gtf
sed -n '/gene "LOC115604079"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "LOC115604079"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115604079.gtf

sed -n '/gene "LOC115604085"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115604085.gtf
sed -n '/gene "LOC115604085"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "LOC115604085"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115604085.gtf

sed -n '/gene "LOC115604473"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115604473.gtf
sed -n '/gene "LOC115604473"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "LOC115604473"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115604473.gtf

sed -n '/gene "LOC115605316"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115605316.gtf
sed -n '/gene "LOC115605316"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "LOC115605316"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115605316.gtf

sed -n '/gene "LOC115605327"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115605327.gtf
sed -n '/gene "LOC115605327"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "LOC115605327"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115605327.gtf

sed -n '/gene "LOC115605360"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115605360.gtf
sed -n '/gene "LOC115605360"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "LOC115605360"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115605360.gtf

sed -n '/gene "LOC115606225"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115606225.gtf
sed -n '/gene "LOC115606225"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "LOC115606225"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115606225.gtf

sed -n '/gene "LOC115606225_circ"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115606225_circ.gtf
sed -n '/gene "LOC115606225_circ"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "LOC115606225_circ"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115606225_circ.gtf

sed -n '/gene "LOC115606427"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115606427.gtf
sed -n '/gene "LOC115606427"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "LOC115606427"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115606427.gtf

sed -n '/gene "LOC115607533"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115607533.gtf
sed -n '/gene "LOC115607533"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "LOC115607533"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115607533.gtf

sed -n '/gene "LOC115608762"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115608762.gtf
sed -n '/gene "LOC115608762"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "LOC115608762"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115608762.gtf

sed -n '/gene "LOC115608763"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115608763.gtf
sed -n '/gene "LOC115608763"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "LOC115608763"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115608763.gtf

sed -n '/gene "LOC115609314"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115609314.gtf
sed -n '/gene "LOC115609314"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "LOC115609314"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115609314.gtf

sed -n '/gene "LOC115609468"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115609468.gtf
sed -n '/gene "LOC115609468"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "LOC115609468"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115609468.gtf

sed -n '/gene "LOC115610106"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115610106.gtf
sed -n '/gene "LOC115610106"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "LOC115610106"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115610106.gtf

sed -n '/gene "LOC115610119"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115610119.gtf
sed -n '/gene "LOC115610119"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "LOC115610119"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115610119.gtf

sed -n '/gene "LOC115610783"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115610783.gtf
sed -n '/gene "LOC115610783"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "LOC115610783"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115610783.gtf

sed -n '/gene "LOC115611198"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115611198.gtf
sed -n '/gene "LOC115611198"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "LOC115611198"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115611198.gtf

sed -n '/gene "LOC115611643"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115611643.gtf
sed -n '/gene "LOC115611643"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "LOC115611643"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115611643.gtf

sed -n '/gene "LOC115614361"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115614361.gtf
sed -n '/gene "LOC115614361"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "LOC115614361"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115614361.gtf

sed -n '/gene "LOC115614485"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115614485.gtf
sed -n '/gene "LOC115614485"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "LOC115614485"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115614485.gtf

sed -n '/gene "LOC115614573"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115614573.gtf
sed -n '/gene "LOC115614573"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "LOC115614573"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115614573.gtf

sed -n '/gene "LOC115615360"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115615360.gtf
sed -n '/gene "LOC115615360"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "LOC115615360"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115615360.gtf

sed -n '/gene "LOC115617122"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115617122.gtf
sed -n '/gene "LOC115617122"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "LOC115617122"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115617122.gtf

sed -n '/gene "LOC115617696"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115617696.gtf
sed -n '/gene "LOC115617696"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "LOC115617696"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115617696.gtf

sed -n '/gene "LOC115617697"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115617697.gtf
sed -n '/gene "LOC115617697"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "LOC115617697"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115617697.gtf

sed -n '/gene "LOC115617703"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115617703.gtf
sed -n '/gene "LOC115617703"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "LOC115617703"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115617703.gtf

sed -n '/gene "LOC115617706"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115617706.gtf
sed -n '/gene "LOC115617706"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "LOC115617706"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115617706.gtf

sed -n '/gene "LOC115617708"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115617708.gtf
sed -n '/gene "LOC115617708"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "LOC115617708"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115617708.gtf

sed -n '/gene "LOC115617712"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115617712.gtf
sed -n '/gene "LOC115617712"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "LOC115617712"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115617712.gtf

sed -n '/gene "LOC115617714"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115617714.gtf
sed -n '/gene "LOC115617714"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "LOC115617714"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115617714.gtf

sed -n '/gene "LOC115618621"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115618621.gtf
sed -n '/gene "LOC115618621"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "LOC115618621"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115618621.gtf

sed -n '/gene "LOC115618791"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115618791.gtf
sed -n '/gene "LOC115618791"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "LOC115618791"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115618791.gtf

sed -n '/gene "LOC115618915"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115618915.gtf
sed -n '/gene "LOC115618915"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "LOC115618915"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115618915.gtf

sed -n '/gene "LOC115618920"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115618920.gtf
sed -n '/gene "LOC115618920"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "LOC115618920"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115618920.gtf

sed -n '/gene "LOC115618964"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115618964.gtf
sed -n '/gene "LOC115618964"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "LOC115618964"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115618964.gtf

sed -n '/gene "LOC115618994"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115618994.gtf
sed -n '/gene "LOC115618994"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "LOC115618994"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115618994.gtf

sed -n '/gene "LOC115618996"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115618996.gtf
sed -n '/gene "LOC115618996"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "LOC115618996"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115618996.gtf

sed -n '/gene "LOC115619025"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115619025.gtf
sed -n '/gene "LOC115619025"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "LOC115619025"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115619025.gtf

sed -n '/gene "LOC115619171"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115619171.gtf
sed -n '/gene "LOC115619171"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "LOC115619171"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115619171.gtf

sed -n '/gene "LOC115619255"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115619255.gtf
sed -n '/gene "LOC115619255"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "LOC115619255"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115619255.gtf

sed -n '/gene "LOC115619267"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115619267.gtf
sed -n '/gene "LOC115619267"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "LOC115619267"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115619267.gtf

sed -n '/gene "LOC115619277"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115619277.gtf
sed -n '/gene "LOC115619277"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "LOC115619277"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115619277.gtf

sed -n '/gene "LOC115619291"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115619291.gtf
sed -n '/gene "LOC115619291"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "LOC115619291"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115619291.gtf

sed -n '/gene "LOC115619298"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC115619298.gtf
sed -n '/gene "LOC115619298"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "LOC115619298"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC115619298.gtf

sed -n '/gene "LOC116915278"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LOC116915278.gtf
sed -n '/gene "LOC116915278"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "LOC116915278"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LOC116915278.gtf

sed -n '/gene "LRRIQ4"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LRRIQ4.gtf
sed -n '/gene "LRRIQ4"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "LRRIQ4"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LRRIQ4.gtf

sed -n '/gene "LTBP4"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_LTBP4.gtf
sed -n '/gene "LTBP4"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "LTBP4"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_LTBP4.gtf

sed -n '/gene "MAG"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_MAG.gtf
sed -n '/gene "MAG"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "MAG"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_MAG.gtf

sed -n '/gene "MAK"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_MAK.gtf
sed -n '/gene "MAK"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "MAK"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_MAK.gtf

sed -n '/gene "MGAT5"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_MGAT5.gtf
sed -n '/gene "MGAT5"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "MGAT5"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_MGAT5.gtf

sed -n '/gene "MOK"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_MOK.gtf
sed -n '/gene "MOK"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "MOK"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_MOK.gtf

sed -n '/gene "NIP7"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_NIP7.gtf
sed -n '/gene "NIP7"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "NIP7"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_NIP7.gtf

sed -n '/gene "NLRC5"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_NLRC5.gtf
sed -n '/gene "NLRC5"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "NLRC5"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_NLRC5.gtf

sed -n '/gene "NWD1"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_NWD1.gtf
sed -n '/gene "NWD1"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "NWD1"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_NWD1.gtf

sed -n '/gene "OBSCN"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_OBSCN.gtf
sed -n '/gene "OBSCN"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "OBSCN"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_OBSCN.gtf

sed -n '/gene "OTUB1"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_OTUB1.gtf
sed -n '/gene "OTUB1"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "OTUB1"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_OTUB1.gtf

sed -n '/gene "PCNT"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_PCNT.gtf
sed -n '/gene "PCNT"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "PCNT"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_PCNT.gtf

sed -n '/gene "PDCD1LG2"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_PDCD1LG2.gtf
sed -n '/gene "PDCD1LG2"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "PDCD1LG2"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_PDCD1LG2.gtf

sed -n '/gene "PDE7B"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_PDE7B.gtf
sed -n '/gene "PDE7B"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "PDE7B"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_PDE7B.gtf

sed -n '/gene "PDZRN4"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_PDZRN4.gtf
sed -n '/gene "PDZRN4"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "PDZRN4"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_PDZRN4.gtf

sed -n '/gene "PLP2"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_PLP2.gtf
sed -n '/gene "PLP2"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "PLP2"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_PLP2.gtf

sed -n '/gene "PP2D1"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_PP2D1.gtf
sed -n '/gene "PP2D1"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "PP2D1"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_PP2D1.gtf

sed -n '/gene "PTCD2"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_PTCD2.gtf
sed -n '/gene "PTCD2"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "PTCD2"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_PTCD2.gtf

sed -n '/gene "RAB36"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_RAB36.gtf
sed -n '/gene "RAB36"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "RAB36"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_RAB36.gtf

sed -n '/gene "REP15"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_REP15.gtf
sed -n '/gene "REP15"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "REP15"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_REP15.gtf

sed -n '/gene "RNF146"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_RNF146.gtf
sed -n '/gene "RNF146"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "RNF146"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_RNF146.gtf

sed -n '/gene "RNF175"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_RNF175.gtf
sed -n '/gene "RNF175"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "RNF175"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_RNF175.gtf

sed -n '/gene "RNF32"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_RNF32.gtf
sed -n '/gene "RNF32"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "RNF32"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_RNF32.gtf

sed -n '/gene "RPUSD2"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_RPUSD2.gtf
sed -n '/gene "RPUSD2"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "RPUSD2"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_RPUSD2.gtf

sed -n '/gene "RSRC1"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_RSRC1.gtf
sed -n '/gene "RSRC1"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "RSRC1"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_RSRC1.gtf

sed -n '/gene "SART1"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_SART1.gtf
sed -n '/gene "SART1"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "SART1"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_SART1.gtf

sed -n '/gene "SELENOP"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_SELENOP.gtf
sed -n '/gene "SELENOP"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "SELENOP"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_SELENOP.gtf

sed -n '/gene "SLC33A1"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_SLC33A1.gtf
sed -n '/gene "SLC33A1"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "SLC33A1"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_SLC33A1.gtf

sed -n '/gene "SNTB2"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_SNTB2.gtf
sed -n '/gene "SNTB2"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "SNTB2"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_SNTB2.gtf

sed -n '/gene "SPATA48"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_SPATA48.gtf
sed -n '/gene "SPATA48"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "SPATA48"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_SPATA48.gtf

sed -n '/gene "SPTBN5"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_SPTBN5.gtf
sed -n '/gene "SPTBN5"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "SPTBN5"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_SPTBN5.gtf

sed -n '/gene "STK19"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_STK19.gtf
sed -n '/gene "STK19"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "STK19"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_STK19.gtf

sed -n '/gene "TACSTD2"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_TACSTD2.gtf
sed -n '/gene "TACSTD2"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "TACSTD2"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_TACSTD2.gtf

sed -n '/gene "TAF1C"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_TAF1C.gtf
sed -n '/gene "TAF1C"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "TAF1C"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_TAF1C.gtf

sed -n '/gene "TARS2"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_TARS2.gtf
sed -n '/gene "TARS2"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "TARS2"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_TARS2.gtf

sed -n '/gene "TCP11"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_TCP11.gtf
sed -n '/gene "TCP11"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "TCP11"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_TCP11.gtf

sed -n '/gene "THOC1"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_THOC1.gtf
sed -n '/gene "THOC1"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "THOC1"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_THOC1.gtf

sed -n '/gene "TNNT3"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_TNNT3.gtf
sed -n '/gene "TNNT3"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "TNNT3"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_TNNT3.gtf

sed -n '/gene "TPO"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_TPO.gtf
sed -n '/gene "TPO"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "TPO"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_TPO.gtf

sed -n '/gene "TRIM14"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_TRIM14.gtf
sed -n '/gene "TRIM14"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "TRIM14"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_TRIM14.gtf

sed -n '/gene "USP39"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_USP39.gtf
sed -n '/gene "USP39"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "USP39"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_USP39.gtf

sed -n '/gene "VARS1"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_VARS1.gtf
sed -n '/gene "VARS1"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "VARS1"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_VARS1.gtf

sed -n '/gene "WDR46"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_WDR46.gtf
sed -n '/gene "WDR46"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "WDR46"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_WDR46.gtf

sed -n '/gene "WDR62"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_WDR62.gtf
sed -n '/gene "WDR62"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "WDR62"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_WDR62.gtf

sed -n '/gene "WDR72"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_WDR72.gtf
sed -n '/gene "WDR72"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "WDR72"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_WDR72.gtf

sed -n '/gene "WNT9B"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_WNT9B.gtf
sed -n '/gene "WNT9B"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "WNT9B"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_WNT9B.gtf

sed -n '/gene "ZC3H12A"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_ZC3H12A.gtf
sed -n '/gene "ZC3H12A"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "ZC3H12A"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_ZC3H12A.gtf

sed -n '/gene "ZNF407"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_ZNF407.gtf
sed -n '/gene "ZNF407"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "ZNF407"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_ZNF407.gtf

sed -n '/gene "ZNF469"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_ZNF469.gtf
sed -n '/gene "ZNF469"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "ZNF469"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_ZNF469.gtf

sed -n '/gene "ZNF865"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_ZNF865.gtf
sed -n '/gene "ZNF865"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf
sed -n '/gene "ZNF865"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_ZNF865.gtf

sed -n '/gene "ZNHIT1"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/preCountsFor_ZNHIT1.gtf
sed -n '/gene "ZNHIT1"/ !p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/tempData.gtf > temp && mv temp /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/attempt4Long/Clean_GCF_004027225.2_bStrHab1.2.pri_genomic.gtf
sed -n '/gene "ZNHIT1"/ p' /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/attempt4Long/Clean_GCF_004027225.2_bStrHab1.2.pri_genomic.gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/postCountsFor_ZNHIT1.gtf

cat preCount*gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/attempt4Long/allRemovedFrom_gff_Ex.txt
wc preCount*gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/attempt4Long/countsForPre_gff_Ex.txt
wc postCount*gff > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/attempt4Long/countsForPost_gff_Ex.txt
rm preCount*gff
rm postCount*gff
cat preCount*gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/attempt4Long/allRemovedFrom_gtf_Ex.txt
wc preCount*gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/attempt4Long/countsForPre_gtf_Ex.txt
wc postCount*gtf > /home/pbiggs/extraDrive2/data/eukaryotes/Kakapo/attempt4Long/countsForPost_gtf_Ex.txt
rm preCount*gtf
rm postCount*gtf
