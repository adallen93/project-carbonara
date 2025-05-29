# Use an official Python image as the base image
FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && \
    apt-get install -y \
    autoconf \
    automake \
    make \
    gcc \
    perl \
    zlib1g-dev\
    libbz2-dev \
    liblzma-dev \
    libcurl4-gnutls-dev \ 
    libssl-dev \ 
    libperl-dev \ 
    libgsl0-dev \
    wget \
    libhts3 \
    # python3-virtualenv \
    && apt-get clean

RUN apt-get install -y software-properties-common


# Install Python 3.7 (required for Snakemake)
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt-get update
RUN apt-get install -y python3.7
RUN apt-get install -y python3.7-distutils

# RUN virtualenv -p /usr/bin/python3.7 venv

RUN update-alternatives --install /bin/python3 python3 /bin/python3.7 1  && \
    update-alternatives --config python3


# Install pip
RUN apt-get install -y pip

# Install BWA
RUN wget http://archive.ubuntu.com/ubuntu/pool/universe/b/bwa/bwa_0.7.17-1_amd64.deb && \
    dpkg -i bwa_0.7.17-1_amd64.deb && \
    rm bwa_0.7.17-1_amd64.deb

# Install SAMtools
RUN wget https://archive.ubuntu.com/ubuntu/pool/universe/s/samtools/samtools_1.10-3_amd64.deb && \
    dpkg -i samtools_1.10-3_amd64.deb && \
    rm samtools_1.10-3_amd64.deb

# Install BCFtools
RUN wget https://archive.ubuntu.com/ubuntu/pool/universe/b/bcftools/bcftools_1.10.2-2_amd64.deb && \
    dpkg -i bcftools_1.10.2-2_amd64.deb && \
    rm bcftools_1.10.2-2_amd64.deb

# Install Snakemake
RUN pip install snakemake==7.8.3

# Set the working directory
WORKDIR /data

# Command to run Snakemake
CMD ["bash"]