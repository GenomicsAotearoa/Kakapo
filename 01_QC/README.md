## Read QC and Trimming

Results are viewable in our [Google Drive QC folder](https://drive.google.com/open?id=1rKB0EycINaNLAhBBjduaOGPyt-RJrllz).

### Fastp and AdapterRemovalV2
Trim and collapse reads. Fastp was run due to an error in the reads which AdapterRemovalV2 could not handle.

### FastQC
FastQC on the raw reads.

### MultiQC
On FastQC results and AdapterRemovalV2 results

### FastQC_2
FastQC on trimmed reads

### MultiQC_2
MultiQC on FastQC_2 runs

### Concatenate and Compress Reads
Block compress reads into 2048kbp blocks using 16 threads. Including: Forward, Reverse, and Collapsed reads.
