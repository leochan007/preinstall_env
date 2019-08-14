#!/bin/bash

sudo yum install centos-release-scl
sudo yum install devtoolset-7-gcc*

echo "source /opt/rh/devtoolset-7/enable" >> /etc/profile
source /etc/profile

#scl enable devtoolset-7 bash

which gcc
gcc --version
