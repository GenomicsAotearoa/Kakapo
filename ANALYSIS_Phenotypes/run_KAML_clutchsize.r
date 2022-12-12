library("KAML")

out <- KAML(pfile="clutchsize_kaml.tsv",
            pheno=2,
            gfile="geno",
            cpu=32,
            sample.num=10,
            crv.num=5,
            GWAS.model="MLM",
            vc.method="emma",
            theSeed=42,
#            K.method="vanraden",
	    cor.threshold=0.995,
	    ref.gwas=FALSE,
	    GWAS.npc=2,
           )

write.table(out$y, "clutchsize_prediction.txt")
write.table(out$gebv, "clutchsize_prediction_gebv.txt")
print(out$vg/(out$vg+out$ve))
print(out$model)

#print(out$top.perc)
