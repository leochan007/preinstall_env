#!/bin/bash

sudo sed -i 's/GRUB_CMDLINE_LINUX=".*"/GRUB_CMDLINE_LINUX="cgroup_enable=memory swapaccount=1 net.ifnames=0"/g'  /etc/default/grub
sudo update-grub

#sudo docker pull rancher/rancher

#sudo docker run -d --restart=unless-stopped -p 80:80 -p 443:443 rancher/rancher

#sudo docker ps -a | awk -F ' ' '{print $1}' |xargs -e sudo docker stop
#echo y | sudo docker system prune

sudo docker stop $(sudo docker ps -aq) && sudo docker  rm -v $(sudo docker ps -aq)
sudo rm -rf /var/lib/etcd/* && sudo rm -rf /etc/kubernetes/*

sudo docker run -d --restart=unless-stopped \
  -p 18080:80 -p 18443:443 \
  -v /var/log/auditlog:/var/log/auditlog \
  -e AUDIT_LEVEL=3 \
  -e AUDIT_LOG_PATH=/var/log/auditlog/rancher-api-audit.log \
  -e AUDIT_LOG_MAXAGE=20 \
  -e AUDIT_LOG_MAXBACKUP=20 \
  -e AUDIT_LOG_MAXSIZE=100 \
  rancher/rancher:stable

#docker run -d -p 8081:8081 -p 8085:8085 -p 8089:8089 --name nexus -v /data/nexus-data:/nexus-data --restart always sonatype/docker-nexus3

#docker run  --restart always -d -p 8081:8081 -p 8443:8443 -p 8085:8085 -p 8089:8089 -v /data/nexus-data:/nexus-data -v /data/nexus-ssl:/opt/sonatype/nexus/etc/ssl --name nexus bradbeck/nexus-https

#docker run -d --restart=unless-stopped \
#  -p 80:80 -p 443:443 \
#  -v /vagrant/scripts/openssl/certs:/vagrant/certs \
#  -e SSL_CERT_DIR="/vagrant/certs" \
#  rancher/rancher:latest
