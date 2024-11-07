# 02_BWA
An implementation of the BWA read alignment algorithm. 

This project searches for a exact matches between a target gene within a reference genome (both in FASTA format). 


## Environment

Requires
    - R version 4.4.X
    - Bioconductor version 3.19

To set up the environment, run:

if (!requireNamespace("BiocManager", quietly = TRUE)) {
  install.packages("BiocManager") # this is the package that manages all of Bioconductor
}


## Datasets

Genomes can be searched for here: https://www.ncbi.nlm.nih.gov/datasets/genome/?taxon=2157,2


## Files

- **shotgun.R**: Generates simulated read data from a reference genome. 