library("KAML")

out <- KAML(pfile="AspOffspring_kaml.txt",
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
            binary=TRUE,
           )

write.table(out$y, "AspOff_prediction.txt")
write.table(out$gebv, "AspOff_prediction_gebv.txt")

print(out$model)
print(out$vg)
print(out$ve)
#print(out$top.perc)
