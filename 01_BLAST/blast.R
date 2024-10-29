if (!requireNamespace("BiocManager", quietly = TRUE)) {
  install.packages("BiocManager")
}

BiocManager::install(version="3.19")
BiocManager::install("rBLAST")

library(rBLAST)

# tgz_file <- blast_db_get("16S_ribosomal_RNA.tar.gz")
# untar(tgz_file, exdir = "16S_rRNA_DB")

blast_result <- blast(db = "16S_rRNA_DB", query = "path/to/your/query.fasta")
print(blast_result)


# how is bioconductor structured
# what format is the gene supposed to be in
# what format is the genome supposed to be in