FROM ubuntu:18.04

# Write project files to the container
COPY apps /cfs/apps
COPY cfe /cfs/cfe
COPY libs /cfs/libs
COPY osal /cfs/osal
COPY psp /cfs/psp
COPY tools /cfs/tools
# COPY Makefile /cfs/Makefile
# COPY sample_defs /cfs/sample_defs
# COPY build_linux.sh /cfs/build_linux.sh
# COPY run_linux.sh /cfs/run_linux.sh

# Run commands from this directory
WORKDIR /cfs

# Install dependencies
RUN apt-get update
RUN apt-get install -y gcc g++ make cmake

# Prepare PC-linux build 
RUN cp cfe/cmake/Makefile.sample Makefile
RUN cp -r cfe/cmake/sample_defs sample_defs
RUN make SIMULATION=native && make && make install
CMD cd build/exe/cpu1/ && ./core-cpu1

# RUN ./build_linux.sh
# CMD ./run_linux.sh
