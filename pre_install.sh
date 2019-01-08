#!/bin/bash

wget https://nodejs.org/dist/v6.10.3/node-v6.10.3-linux-x64.tar.xz
tar -xvf node-v6.10.3-linux-x64.tar.xz
mv node-v6.10.3-linux-x64 /usr/local/

sudo echo -e "export NODE_HOME=/usr/local/node-v6.10.3-linux-x64" >> /etc/profile
sudo echo -e "export PATH=$NODE_HOME/bin:$PATH" >> /etc/profile

if [ -n "$1" ]; then
    npm config set registry https://registry.npm.taobao.org 
    npm install -g gulp node-gyp node-sass
fi

mkdir app/upload

ln -s /mnt/models app/upload/video
