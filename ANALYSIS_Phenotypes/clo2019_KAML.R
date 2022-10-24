library("KAML")
#geno2019 = KAML.Data(bfile="filtered_maf0005", out="geno2019")

out <- KAML(pfile="clo2019_kaml.txt", 
  pheno=1, 
  gfile="geno2019", 
  cpu=32, 
  sample.num=10, 
  crv.num=10, 
  GWAS.model="RR",  # MLM
  vc.method="emma", #brent", 
  theSeed=42, 
  K.method="vanraden", 
  cor.threshold=0.95, 
  ref.gwas=FALSE,
  GWAS.npc=0,
  prior.model="QTN+K",
  qtn.model="MR"
) 

#write.table(out$y, "fe_norh_prediction.txt")
#write.table(out$gebv, "fe_norh_prediction_gebv.txt")
#print(out$top.perc)
