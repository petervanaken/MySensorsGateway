#!/bin/bash

if [ ! -d "tools" ] ; then
    mkdir tools
fi

if [ ! -d "tools/raburton" ] ; then
    git clone https://github.com/raburton/esp8266.git tools/raburton
fi

if [ ! -d "tools/esptool2" ] ; then
    git clone https://github.com/raburton/esptool2.git tools/esptool2
fi

if [ ! -d "tools/Sming" ] ; then
    cd tools
    wget https://github.com/SmingHub/Sming/archive/2.0.0.tar.gz
    tar xzvf 2.0.0.tar.gz Sming-2.0.0/Sming
    mv Sming-2.0.0/Sming Sming
    rm -rf Sming-2.0.0
    rm -rf *.tar.gz
    cd ..
fi

if [ ! -d "tools/Sming/Libraries/MySensors" ] ; then
    git clone https://github.com/alainmaes/MySensors.git tools/Sming/Libraries/MySensors
fi

if [ ! -d "tools/Sming/Libraries/MyInterpreter" ] ; then
    git clone https://github.com/alainmaes/MyInterpreter.git tools/Sming/Libraries/MyInterpreter
fi

cd tools/esptool2
make
cd ../../

cd tools/Sming
#sed -i 's/^#include <mem.h>/\/\/#include <mem.h>/g' rboot/appcode/rboot-api.c
export SMING_HOME=`pwd`
make rebuild
cd spiffy
make

