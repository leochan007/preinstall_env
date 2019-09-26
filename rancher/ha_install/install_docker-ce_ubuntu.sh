#!/bin/bash

sudo apt update
sudo apt-get remove docker docker-engine docker.io
sudo apt-get install -y \
   apt-transport-https \
   ca-certificates \
   curl \
   software-properties-common

sudo curl -fsSL http://mirrors.cloud.aliyuncs.com/docker-ce/linux/ubuntu/gpg | sudo apt-key add -
sudo curl -fsSL http://mirrors.aliyun.com/docker-ce/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository "deb [arch=amd64] http://mirrors.cloud.aliyuncs.com/docker-ce/linux/ubuntu $(lsb_release -cs) stable"

#curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
#sudo add-apt-repository \
#      "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
#      $(lsb_release -cs) \
#      stable"

sudo apt-get update

apt-cache madison docker-ce

sudo apt-get install -y docker-ce=5:18.09.9~3-0~ubuntu-bionic

#sudo groupadd docker
#sudo gpasswd -a vagrant docker
#sudo service docker restart
#newgrp - docker
