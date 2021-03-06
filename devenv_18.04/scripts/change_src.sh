#!/bin/bash

#apt-get update

#

sudo mv /etc/apt/sources.list /etc/apt/sources.list.bak

sudo echo -e "\n\
deb http://mirrors.aliyun.com/ubuntu/ bionic main restricted universe multiverse \n\
deb http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse \n\
deb http://mirrors.aliyun.com/ubuntu/ bionic-updates main restricted universe multiverse \n\
deb http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse \n\
deb http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse \n\
deb-src http://mirrors.aliyun.com/ubuntu/ bionic main restricted universe multiverse \n\
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse \n\
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-updates main restricted universe multiverse \n\
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse \n\
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse" \
    > /etc/apt/sources.list

#\

# Update packages
sudo apt-get update

sudo apt-get install --allow-remove-essential -y apt-utils vim tzdata

sudo apt-get install -y make python3-pip

sudo cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
