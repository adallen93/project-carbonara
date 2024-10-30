# 01_BLAST
An implementation of the BLAST sequence alignment algorithm. 

This project searches for a target gene within a reference genome (both in FASTA format), and identifies the regions of greatest overlap. 


## Environment

Requires
    - R version 4.4.X
    - Bioconductor version 3.19

To set up the environment, run:

if (!requireNamespace("BiocManager", quietly = TRUE)) {
  install.packages("BiocManager") # this is the package that manages all of Bioconductor
}

BiocManager::install("rBLAST") # this installs the BLAST implementation


## Datasets

Genes can be searched for here, and downloaded in FASTA format: https://www.ncbi.nlm.nih.gov/pathogens/microbigge/#

Genomes can be searched for here: https://www.ncbi.nlm.nih.gov/datasets/genome/?taxon=2157,2

The genome technically has to be in BLAST database format, but the code handles the conversion from FASTA to database using the makeblastdb function. 