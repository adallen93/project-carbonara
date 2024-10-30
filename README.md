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