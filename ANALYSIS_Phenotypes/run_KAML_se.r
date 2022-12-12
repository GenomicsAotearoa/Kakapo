library("KAML")

out <- KAML(pfile="SurvivingEmbryos_kaml.txt",
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

write.table(out$y, "survingembryos_prediction.txt")
write.table(out$gebv, "survivingembryos_prediction_gebv.txt")
print(out$model)
#print(out$top.perc)

# 0.44 h2
