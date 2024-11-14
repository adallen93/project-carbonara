# 02_BWA
An implementation of the BWA read alignment algorithm. 

This project searches for a exact matches between a target gene within a reference genome (both in FASTA format). The reference genome must be indexed before reads can be mapped.


## Environment

Requires
    - Snakemake v3.13.3
    - BWA v0.17.8


## Datasets

Genomes can be searched for here, in FASTA format: https://ncbi.nlm.nih.gov/nuccore/
FASTQ files can be found here, labelled by accession: https://www.ncbi.nlm.nih.gov/Traces/index.html?view=run_browser&display=metadata
Accession IDs can be found here: https://www.ncbi.nlm.nih.gov/sra?term=%22escherichia%20coli%22%5BOrganism%5D


## Files

- **shotgun.R**: Generates simulated read data from a reference genome. 
- **Snakefile**: Defines steps in the read mapping pipeline for Snakemake. 