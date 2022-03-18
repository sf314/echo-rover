FROM ubuntu:18.04

# Install dependencies
RUN apt-get update
RUN apt-get install -y gcc g++ make cmake

# Write project files to the container
COPY apps /cfs/apps
COPY cfe /cfs/cfe
COPY libs /cfs/libs
COPY osal /cfs/osal
COPY psp /cfs/psp
COPY tools /cfs/tools

# Run commands from this directory
WORKDIR /cfs

# Prepare PC-linux build 
RUN cp cfe/cmake/Makefile.sample Makefile
RUN cp -r cfe/cmake/sample_defs sample_defs
RUN make SIMULATION=native && make && make install
CMD cd build/exe/cpu1/ && ./core-cpu1
