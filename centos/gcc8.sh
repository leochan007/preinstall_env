#!/bin/bash

yum -y install centos-release-scl
yum -y install devtoolset-8-gcc devtoolset-8-gcc-c++ devtoolset-8-binutils
echo "source /opt/rh/devtoolset-8/enable" >> /etc/profile
source /etc/profile
