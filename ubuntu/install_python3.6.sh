#!/bin/bash

sudo add-apt-repository ppa:jonathonf/python-3.6

sudo apt-get update

sudo apt-get install -y python3.6 python3.6-dev

sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.5 1

sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.6 2

sudo update-alternatives --config python3

#pip install -U pip
sudo apt install python3-pip
#wget https://bootstrap.pypa.io/get-pip.py
#python3.6 get-pip.py
#ln -s /usr/bin/pip3
