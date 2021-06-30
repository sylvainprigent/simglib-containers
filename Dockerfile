FROM ubuntu:20.04

WORKDIR /app

COPY . /app

RUN apt-get -y update && \
    apt-get -y upgrade && \
    apt-get -y install cmake && \
    apt-get -y install g++ && \
    apt-get -y install git && \
    apt-get -y install libtiff-dev && \
    apt-get -y install libfftw3-dev && \
    git clone https://github.com/sylvainprigent/simglib.git && \ 
    cd simglib && \
    mkdir build && \
    cd build && \
    cmake .. -Dsimglib_BUILD_TOOLS=ON -DSL_USE_OPENMP=ON -Dsimglib_BUILD_CUDA=OFF && \
    make && \
    make install && \ 
	cd .. 

CMD ["bash"]
