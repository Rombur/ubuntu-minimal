FROM ubuntu

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
        gcc \
        gfortran \
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

# Create a user
RUN useradd -ms /bin/bash docker
USER docker
WORKDIR /home/docker

RUN echo 'module() { eval `/usr/bin/modulecmd bash $*`; }' >> ~/.bashrc
RUN echo '. /home/docker/spack/share/spack/setup-env.sh' >> ~/.bashrc
RUN bash -c "source ~/.bashrc"

# Use spack to install the latest version of the libraries
RUN cd /home/docker && git clone https://github.com/llnl/spack.git
ENV PATH=/home/docker/spack/bin:$PATH
RUN spack install vim +huge +python
RUN spack install openmpi
