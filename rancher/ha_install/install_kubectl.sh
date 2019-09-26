#!/bin/bash

#aliyun
apt-get update && apt-get install -y apt-transport-https
curl https://mirrors.aliyun.com/kubernetes/apt/doc/apt-key.gpg | apt-key add - 
cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb https://mirrors.aliyun.com/kubernetes/apt/ kubernetes-bionic main
EOF
apt-get update
apt-get install -y kubectl

apt-get install -y kubelet kubeadm kubectl

#https://docs.docker.com/install/linux/docker-ce/ubuntu/#install-docker-ce-1
#test: http_proxy=127.0.0.1:28000 https_proxy=127.0.0.1:28000 wget google.com
#http_proxy=127.0.0.1:28000 https_proxy=127.0.0.1:28000 kubeadm config images pull
#http_proxy=127.0.0.1:28000 https_proxy=127.0.0.1:28000 kubeadm init  --pod-network-cidr=192.168.1.0/24
