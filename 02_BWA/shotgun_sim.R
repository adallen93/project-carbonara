##################################################
### Shotgun sequence simulation
##################################################
### Given a specified genome, this code generates
### a simulated set of reads through random
### partitioning.
##################################################

# setup
if (!requireNamespace("BiocManager", quietly = TRUE)) {
  install.packages("BiocManager")
}

BiocManager::install(version="3.19")
BiocManager::install("Biostrings")

library(Biostrings)

# load in reference genome
fasta_file <- "path/to/your_genome.fasta"
sequences <- readDNAStringSet(fasta_file)

# split a genome into random-length segments
split_random_lengths <- function(seq, min_length, max_length) {
  lengths <- c()
  while (length(seq) > 0) {
    len <- sample(seq(min_length, max_length), 1)
    if (len > length(seq)) len <- length(seq)
    lengths <- c(lengths, len)
    seq <- subseq(seq, start = len + 1)
  }
  return(lengths)
}

# generate sequence dataset
min_length <- 50
max_length <- 200
split_seqs <- list()

for (i in seq_along(sequences)) {
  seq <- sequences[[i]]
  lengths <- split_random_lengths(seq, min_length, max_length)
  pos <- 1
  for (len in lengths) {
    sub_seq <- subseq(seq, start = pos, width = len)
    split_seqs <- c(split_seqs, sub_seq)
    pos <- pos + len
  }
}

# write to file
for (i in seq_along(split_seqs)) {
  writeXStringSet(DNAStringSet(split_seqs[[i]]), filepath = paste0("split_sequence_", i, ".fasta"))
}
