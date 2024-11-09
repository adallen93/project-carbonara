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
df <- read.csv(here::here("02_BWA", fn))

# do transformation
df$c <- with(df, a + b)

# create file
write.csv(df, here::here("02_BWA/data/output.csv"))
