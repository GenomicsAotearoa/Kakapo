library("KAML")

out <- KAML(pfile="M_kaml_format.txt",
            pheno=2,
            gfile="geno",
            cpu=12,
            sample.num=10,
            crv.num=10,
            GWAS.model="MLM",
            vc.method="brent",
            theSeed=42,
            #K.method="vanraden",
	    cor.threshold=0.9, 
	    ref.gwas=FALSE,
	    GWAS.npc=0,
           )

write.table(out$y, "M_morehu_prediction.txt")
write.table(out$gebv, "M_morehu_prediction_gebv.txt")
print(out$model)
#print(out$top.perc)
