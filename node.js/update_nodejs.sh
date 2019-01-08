#!/bin/bash

#https://npm.taobao.org/mirrors/node/v8.9.0/node-v8.9.0-linux-x64.tar.xz
ver=v8.9.3
node_ver=node-$ver-linux-x64
wget https://npm.taobao.org/mirrors/node/$ver/$node_ver.tar.xz
tar -xvf $node_ver.tar.xz
sudo mv $node_ver /usr/local/

sudo echo -e "export NODE_HOME=/usr/local/$node_ver" >> ~/.bashrc
sudo echo -e "export PATH=/usr/local/$node_ver/bin:$PATH" >> ~/.bashrc

if [ -n "$1" ]; then
    #npm config set registry https://registry.npm.taobao.org
    npm install -g cnpm
    npm install -g gulp node-gyp node-sass
fi
