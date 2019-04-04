
# Conda faststructure (but had to install manually too...)
for i in $(seq 1 20);
do
	python /nesi/project/uoo02695/software/fastStructure/structure.py -K $i --input=testing --output=faststructure-testing/testing
done
