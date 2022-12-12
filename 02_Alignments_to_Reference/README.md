## Perform Read Mapping

Given processed reads as in step 01...

### Map Reads using BWA
Export as CRAM files, rename to the individual ID. Merge paired and single ended mappings. Add read groups (RG) tag to CRAM files.

Generate stats, flagstats, idxstats from samtools.

### MultiQC
Run MultiQC on stats files from step above
