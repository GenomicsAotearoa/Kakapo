library("KAML")

out <- KAML(pfile="egg_shape_ratio_0centered_kaml.txt",
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

write.table(out$y, "eggshape_prediction.txt")
write.table(out$gebv, "eggshape_prediction_gebv.txt")
print(out$model)
#print(out$top.perc)
