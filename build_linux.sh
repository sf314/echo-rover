#!/bin/bash

# On first run, ensure the Makefile and defs are in place.
if [ -e Makefile ]; then
    echo "Makefile and sample_defs already exist."
else
    echo "Makefile and sample_defs will be placed at root level."
    cp cfe/cmake/Makefile.sample Makefile
    cp -r cfe/cmake/sample_defs sample_defs
    sed -i 's/undef OSAL_DEBUG_PERMISSIVE_MODE/define OSAL_DEBUG_PERMISSIVE_MODE/g' sample_defs/default_osconfig.h
fi

make SIMULATION=native
# make prep
make
make install
