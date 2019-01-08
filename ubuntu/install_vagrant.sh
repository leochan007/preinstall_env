#!/bin/bash

wget https://download.virtualbox.org/virtualbox/5.2.18/virtualbox-5.2_5.2.18-124319~Ubuntu~xenial_amd64.deb

dpkg -i virtualbox-5.2_5.2.18-124319~Ubuntu~xenial_amd64.deb

#apt-get install -f vagrant
wget https://releases.hashicorp.com/vagrant/2.1.5/vagrant_2.1.5_i686.deb

dpkg -i vagrant_2.1.5_i686.deb

vagrant box add ubuntu/xenial64

vagrant box update
