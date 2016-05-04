FROM ubuntu:16.04

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
        gcc \
        build-essential \
        cmake \
        autoconf \
        wget \
        curl \
        environment-modules \
        bison \
        zip \
        python \
        git

ENV alias module="/usr/bin/modulecmd sh"

# Use spack to install the latest version of the libraries
RUN cd /home && git clone https://github.com/llnl/spack.git
ENV PATH=/home/spack/bin:$PATH
RUN bash -c ". /home/spack/share/spack/setup-env.sh"
RUN spack install gcc
RUN spack install vim +huge +python
RUN spack install openmpi
