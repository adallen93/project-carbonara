##################################################
### BLAST sequence alignment implementation
##################################################
### Given a specified gene and genome, this code
### identifies the most likely matching locations
### in the target genome.
##################################################

# setup
if (!requireNamespace("BiocManager", quietly = TRUE)) {
  install.packages("BiocManager")
}

BiocManager::install(version="3.19")
BiocManager::install("rBLAST")

library(rBLAST)
library(here)


# make BLAST database from FASTA file
makeblastdb(file = here("01_BLAST/data/genome/genome1/ncbi_dataset/data/GCA_000008865.2/GCA_000008865.2_ASM886v2_genomic.fna"),
            db_name = here("01_BLAST/data/genome/genome1_db/e_coli_db"),
            dbtype = "nucl")

# set up database object
db <- blast(db = here("01_BLAST/data/genome/genome1_db/e_coli_db"), type="blastn")

# create sequence object from gene FASTA file
seq <- readRNAStringSet(here("01_BLAST/data/gene/sequence1.fasta"))

# look for matches
matches <- predict(db, seq[1])