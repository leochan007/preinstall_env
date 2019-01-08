#!/bin/bash

yum install -y wget vim curl gcc gcc-c++ git

wget -O /etc/yum.repos.d/epel.repo http://mirrors.aliyun.com/repo/epel-7.repo

yum install -y ntfs-3g nmap clang
