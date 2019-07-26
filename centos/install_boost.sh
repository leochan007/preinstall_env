#!/bin/bash

wget https://dl.bintray.com/boostorg/release/1.70.0/source/boost_1_70_0.tar.bz2

tar -jxvf boost_1_70_0.tar.bz2

cd boost_1_70_0

./bootstrap.sh

sudo ./b2 install --with-python --prefix=/usr/lib64/boost_1_70_0 --build-type=complete --layout=tagged link=static runtime-link=static --debug-configuration threading=multi debug release address-model=64 cflags=-fPIC cxxflags=-fPIC

sudo ./b2 install --prefix=/usr/lib64/boost_1_70_0 --build-type=complete --layout=tagged link=static runtime-link=static --debug-configuration threading=multi debug release address-model=64 cflags=-fPIC cxxflags=-fPIC
