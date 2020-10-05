


trueGenotypes = as.matrix(read.table("allGenotypes.txt"))
dosages = as.matrix(read.table("seq-results.txt.dosages"))

all(trueGenotypes[,1] == dosages[,1]) #Check to see if the ids are the same between the true genotype file and the dosage file.

trueGenotypes = trueGenotypes[,-1]
dosages = dosages[,-1]

values = sapply(1:nrow(trueGenotypes), function(index) {
    cor(trueGenotypes[index,], dosages[index,])
    })

plot(values)

nIndPerGeneration = 200
nGenerations = 10

generationalValues = sapply(1:nGenerations, function(index) {
    indicies = ((index-1)*nIndPerGeneration + 1) : (index*nIndPerGeneration)
    mean(values[indicies])
    })
print("mean value for each generation")
print(data.frame(generation=1:nGenerations, correlation=generationalValues))

