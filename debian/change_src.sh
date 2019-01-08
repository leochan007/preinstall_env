#!/bin/bash

mv /etc/apt/sources.list /etc/apt/sources.list.bak

echo -e "
deb http://mirrors.aliyun.com/debian/ jessie main non-free contrib \n\
deb http://mirrors.aliyun.com/debian/ jessie-proposed-updates main non-free contrib \n\
deb-src http://mirrors.aliyun.com/debian/ jessie main non-free contrib \n\
deb-src http://mirrors.aliyun.com/debian/ jessie-proposed-updates main non-free contrib \n\
" >> /etc/apt/sources.list

#\
#deb http://extras.ubuntu.com/ubuntu/ xenial main \n

# Update packages
apt-get update
apt-get install -y --allow-remove-essential apt-utils vim tzdata

cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
