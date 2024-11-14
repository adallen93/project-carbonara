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

BiocManager::install(version = "3.18") # 3.19 only works on R 4.4
BiocManager::install("Biostrings")

library(Biostrings)

# Ask the user for the path to the reference genome
fasta_file <- readline(
  prompt = "Please type the full path to your FASTA file containing a reference genome.\n"
)

# Load the reference genome
sequences <- Biostrings::readDNAStringSet(fasta_file) # Broken: needs RCurl

# split a genome into random-length segments
split_random_lengths <- function(seq, min_length, max_length) {
  lengths <- c()
  while (length(seq) > 0) {
    len <- sample(seq(min_length, max_length), 1)
    if (len > length(seq)) len <- length(seq)
    lengths <- c(lengths, len)
    seq <- subseq(seq, start = len + 1) # Broken: needs RCurl
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
