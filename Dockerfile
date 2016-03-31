FROM ubuntu:15.10

RUN apt-get update && apt-get upgrade && apt-get install -y \
        gcc \
        gfortran \
        build-essential \
        vim-nox \
        cmake \
        wget \
        curl \
        ipython \
        ipython3 \
        git
