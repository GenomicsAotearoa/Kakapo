
VCF was created with minimap2:
```
minimap2 -t10 -cx asm20  --cs  genomes/kakapo.fna.gz genomes/kea.fna.gz  | sort -k6,6 -k8,8n > ali/kakapo_v_kea_sorted.paf
paftools.js call -f genomes/kakapo.fna.gz ali/kakapo_v_kea_sorted.paf > kakapo_ref.vcf
```
genomes directory contains md5s to check content/chromosome names etc

