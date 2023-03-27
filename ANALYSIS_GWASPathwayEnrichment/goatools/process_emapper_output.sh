cut -f 1,10 KakapoEggnog2023_taxscope.emapper.annotations | grep -v "#" > go_mappings_taxscope.txt 
cut -f 1,10 KakapoEggnog2023.emapper.annotations | grep -v "#" > go_mappings.txt

# Then manually replace "-" with "" (blank) with nano or other text editor
