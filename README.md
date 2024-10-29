# project-carbonara
Pasta and genomics. But mainly genomics.

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

Genomes are also downladed in FASTA format, but need to be converted to a BLAST database prior to sequence alignment. This can be done using the makeblastdb tool, found here: https://ncbi.github.io/magicblast/cook/blastdb.html