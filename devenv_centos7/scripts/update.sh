#/bin/bash

sudo yum -y install epel-release
sudo yum -y install centos-release-scl
sudo yum -y install devtoolset-7-gcc*
scl enable devtoolset-7 bash

sudo yum -y install python-pip telnet lsof

sudo pip install -U pip Cython supervisor numpy -i https://pypi.douban.com/simple/ 

#which gcc
#gcc --version
