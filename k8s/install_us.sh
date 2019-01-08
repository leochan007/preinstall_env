#!/bin/bash

apt-get update && apt-get install -y apt-transport-https
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb http://apt.kubernetes.io/ kubernetes-xenial main
EOF
apt-get update
apt-get install -y kubelet kubeadm kubectl

#https://docs.docker.com/install/linux/docker-ce/ubuntu/#install-docker-ce-1
#kubeadm init  --pod-network-cidr=10.28.212.0/24
