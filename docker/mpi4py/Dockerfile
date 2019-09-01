FROM ubuntu_py3_base:latest
MAINTAINER borgwang
USER root

# install openmpi
RUN wget https://download.open-mpi.org/release/open-mpi/v4.0/openmpi-4.0.1.tar.gz && \
    tar -zxf openmpi-4.0.1.tar.gz && \
    cd openmpi-4.0.1 && \
    ./configure --prefix=/usr/local/openmpi --enable-orterun-prefix-by-default && \
    make -j && \
    make install -j && \
    export PATH=/usr/local/openmpi/bin:$PATH

# clean up
RUN rm -rf openmpi-4.0.1*

# install mpi4py
ENV PATH="/usr/local/openmpi/bin:${PATH}"
RUN pip3 install mpi4py==3.0.2

RUN bash