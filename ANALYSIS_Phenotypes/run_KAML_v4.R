library("KAML")

out <- KAML(pfile="rand.tsv",
            pheno=2,
            gfile="geno",
            cpu=24,
            sample.num=10,
            crv.num=10,
            GWAS.model="MLM",
            vc.method="emma",
            theSeed=42,
            K.method="vanraden",
	    cor.threshold=0.3,
	    ref.gwas=TRUE,
	    GWAS.npc=0,
           )

write.table(out$y, "rand_prediction.txt")
write.table(out$gebv, "rand_prediction_gebv.txt")
print(out$model)
