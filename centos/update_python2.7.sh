#!/bin/bash

yum install -y readline-devel openssl-devel

mkdir tmp

cd tmp

VER=2.7.14

if [ ! -d Python-$VER ]; then
  if [ ! -f Python-$VER.tar.xz ]; then
    #wget https://www.python.org/ftp/python/2.7.14/Python-2.7.14.tar.xz
    curl -O https://www.python.org/ftp/python/$VER/Python-$VER.tar.xz
  fi
  tar -xJvf Python-$VER.tar.xz
fi

cd Python-$VER/

./configure --prefix=/usr/local/python2.7

make && make install

rm -f /usr/local/bin/python

ln -s /usr/local/python2.7/bin/python2.7 /usr/local/bin/python

cd ..
#curl -O https://bootstrap.pypa.io/get-pip.py
python get-pip.py
mv /usr/bin/pip /usr/bin/pip275
ln -s /usr/local/python2.7/bin/pip /usr/bin/pip
