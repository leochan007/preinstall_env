#!/bin/bash

yum install -y readline-devel openssl-devel

VER=5.3.4

fn=lua-$VER.tar.gz

mkdir /tmp

cd /tmp

rm -rf lua-$VER $FN

if [ ! -d lua-$VER ]; then
  curl -O http://www.lua.org/ftp/$FN
  tar -xvf $FN
fi

cd lua-$VER/

make linux

make install

#cd /usr/bin

#mv lua lua.bak
#mv luac luac.bak

#ln -s /usr/local/bin/lua /usr/bin/lua

#ln -s /usr/local/bin/luac /usr/bin/luac
