FROM ubuntu:15.10

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
        gcc \
        gfortran \
        build-essential \
        openmpi-bin \
        vim-nox \
        cmake \
        autoconf \
        wget \
        curl \
        ipython \
        ipython3 \
        git
