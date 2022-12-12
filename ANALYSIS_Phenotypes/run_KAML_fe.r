library("KAML")

out <- KAML(pfile="FertileEggs_kaml.txt",
            pheno=2,
            gfile="geno",
            cpu=12,
            sample.num=10,
            crv.num=5,
            GWAS.model="RR",
            vc.method="emma", # emma gives 0.80 herit, brent is 0.2, 0.37 (multiple runs), he fails, # emma+RR is 0.20
            theSeed=42,
            #K.method="vanraden",
	    cor.threshold=0.99,
	    ref.gwas=FALSE,
	    GWAS.npc=0,
           )

write.table(out$y, "fe_prediction.txt")
write.table(out$gebv, "fe_prediction_gebv.txt")
print(out$model)
#print(out$top.perc)
