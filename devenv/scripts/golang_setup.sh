#!/bin/bash

VER=1.12

file=go$VER.linux-amd64.tar.gz
goroot=/usr/local/go
gopath=/workspace/go

if [ ! -d "$goroot" ]; then

    if [ ! -f "$file" ]; then
      echo "start download"
        wget https://studygolang.com/dl/golang/go$VER.linux-amd64.tar.gz
        #https://studygolang.com/dl/golang/go1.9.2.linux-amd64.tar.gz
        rm -rf go
    fi

    if [ ! -d "go" ]; then
        tar -xzvf $file
    fi

    sudo cp -rf go /usr/local/
fi

cd ..

echo export GOROOT=$goroot >> ~/.bashrc
echo export PATH=$goroot/bin:$PATH >> ~/.bashrc
echo export GOPATH=$gopath >> ~/.bashrc
mkdir -p $gopath
