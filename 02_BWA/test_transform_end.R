##################################################
### Arbitrary data transformation
##################################################
### Given a specified filename, this performs
### an arbitrary transformation as a demo for
### Snakemake.
##################################################

library("here")

# read in filename from command line arguments
args <- commandArgs(trailingOnly = TRUE)

# read in file
fn <- args[1]
fnum <- gsub("data/mid_", "", fn)
fnum <- gsub("\\.csv", "", fnum)

df <- read.csv(here::here("02_BWA", fn))

# do transformation
df$d <- with(df, a * c)

# create file
write.csv(df, here::here(sprintf("02_BWA/data/output_%s.csv", fnum)), row.names=F)
