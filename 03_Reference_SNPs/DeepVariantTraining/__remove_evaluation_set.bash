# Run from the vcf directory
ls *vcf | shuf | head -n 20 | xargs -l -I {} mv {} ../model_eval/
