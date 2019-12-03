ls training_examples/* | shuf | head -n 25 | xargs -l -i mv {} training_evaluation/
