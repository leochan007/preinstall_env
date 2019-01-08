#!/bin/bash

sudo apt-get remove docker docker-engine docker.io
sudo apt-get install -y \
   apt-transport-https \
   ca-certificates \
   curl \
   software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
      "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
      $(lsb_release -cs) \
      stable"

sudo apt-get update

#apt-cache madison docker-ce

#sudo apt-get install -y docker-ce=17.03.2~ce-0~ubuntu-xenial
sudo apt-get install -y docker-ce
sudo groupadd docker
sudo gpasswd -a ${USER} docker
sudo service docker restart
newgrp - docker
