library("KAML")

out <- KAML(pfile="weights_b1_kaml.txt",
            pheno=2,
            gfile="geno",
            cpu=32,
            sample.num=10,
            crv.num=5,
            GWAS.model="MLM",
            vc.method="emma",
            theSeed=42,
            #K.method="vanraden",
	    cor.threshold=0.995,
	    ref.gwas=FALSE,
	    GWAS.npc=0,
           )

write.table(out$y, "b1_prediction.txt")
write.table(out$gebv, "b1_prediction_gebv.txt")
print(out$model)
#print(out$top.perc)
