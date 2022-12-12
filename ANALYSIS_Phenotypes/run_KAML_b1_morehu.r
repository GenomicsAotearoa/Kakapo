library("KAML")

out <- KAML(pfile="b1_kaml_format.txt",
            pheno=2,
            gfile="geno",
            cpu=12,
            sample.num=10,
            crv.num=10,
            GWAS.model="MLM", # Previously MLM
            vc.method="brent", # Previously brent
            theSeed=42,
            #K.method="vanraden",
	    cor.threshold=0.9, # Previously 0.3
	    ref.gwas=FALSE, # Previously false
	    GWAS.npc=0, # Previously 0 
           )

write.table(out$y, "b1_morehu_prediction.txt")
write.table(out$gebv, "b1_morehu_prediction_gebv.txt")
print(out$model)
#print(out$top.perc)
