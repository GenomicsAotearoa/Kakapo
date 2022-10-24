library("KAML")

out <- KAML(pfile="weights_M_kaml.txt",
            pheno=2,
            gfile="geno",
            cpu=12,
            sample.num=10,
            crv.num=5,
            GWAS.model="MLM",
            vc.method="brent",
            theSeed=42,
            K.method="vanraden",
	    cor.threshold=0.3,
	    ref.gwas=FALSE,
	    GWAS.npc=0,
           )

write.table(out$y, "M_prediction.txt")
write.table(out$gebv, "M_norh_prediction_gebv.txt")
print(out$model)
#print(out$top.perc)
