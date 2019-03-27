
## prepare.sh
Copy CRAM files (and indices) over so we can combined them. Also delete Sarah-2 due to poor read alignment.

## combine.nf
Combine all reads for a sample into a single CRAM file, example: Sarah_001, Sarah_002, Sarah_003, etc... go into Sarah.cram
