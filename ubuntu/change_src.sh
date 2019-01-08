#!/bin/bash

mv /etc/apt/sources.list /etc/apt/sources.list.bak

echo -e "deb http://mirrors.aliyun.com/ubuntu/ xenial main restricted universe multiverse \n\
deb http://mirrors.aliyun.com/ubuntu/ xenial-security main restricted universe multiverse \n\
deb http://mirrors.aliyun.com/ubuntu/ xenial-updates main restricted universe multiverse \n\
deb http://mirrors.aliyun.com/ubuntu/ xenial-backports main restricted universe multiverse \n\
##测试版源 \n\
deb http://mirrors.aliyun.com/ubuntu/ xenial-proposed main restricted universe multiverse \n\
##源码 \n\
deb-src http://mirrors.aliyun.com/ubuntu/ xenial main restricted universe multiverse \n\
deb-src http://mirrors.aliyun.com/ubuntu/ xenial-security main restricted universe multiverse \n\
deb-src http://mirrors.aliyun.com/ubuntu/ xenial-updates main restricted universe multiverse \n\
deb-src http://mirrors.aliyun.com/ubuntu/ xenial-backports main restricted universe multiverse \n\
##测试版源 \n\
deb-src http://mirrors.aliyun.com/ubuntu/ xenial-proposed main restricted universe multiverse \n\
# Canonical 合作伙伴和附加 \n\
deb http://archive.canonical.com/ubuntu/ xenial partner \n" \
    >> /etc/apt/sources.list

#\
#deb http://extras.ubuntu.com/ubuntu/ xenial main \n

# Update packages
apt-get update
apt-get install -y --allow-remove-essential apt-utils vim tzdata

cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
