#!/bin/bash

#https://docs.docker.com/install/linux/docker-ce/ubuntu/

sudo apt-get remove docker docker-engine docker.io
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

#curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
#sudo add-apt-repository \
#      "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
#      $(lsb_release -cs) \
#      stable"

sudo apt-get update

#apt-cache madison docker-ce

#sudo apt-get install -y docker-ce=17.03.2~ce-0~ubuntu-xenial
sudo apt-get install -y docker-ce
#sudo groupadd docker
sudo gpasswd -a vagrant docker
sudo service docker restart
newgrp - docker


#https://docs.docker.com/install/linux/docker-ce/ubuntu/

