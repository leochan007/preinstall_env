#!/bin/bash

NEXUS_DIR=/data/nexus-data

sudo mkdir -p $NEXUS_DIR && sudo chown -R 200 $NEXUS_DIR

sudo docker ps -a |grep docker-nexus3 | awk -F ' ' '{print $1}' |xargs sudo docker stop && echo y | sudo docker system prune

sudo docker run -d -p 8081:8081 -p 8085:8085 -p 8089:8089 --name nexus -v $NEXUS_DIR:/nexus-data --restart always sonatype/docker-nexus3
#docker run -d -p 8081:8081 -p 8085:8085 -p 8089:8089 --name nexus -v /data/nexus-data:/nexus-data --restart always sonatype/docker-nexus3

#docker run -d -p 8081:8081 --name nexus -v $NEXUS_DIR:/nexus-data sonatype/docker-nexus3

#sudo cp -rf docker.service /etc/systemd/system/multi-user.target.wants/docker.service
#sudo systemctl daemon-reload
sudo cp -rf daemon.json /etc/docker/

sudo service docker restart

#--insecure-registry http://127.0.0.1:8081
#docker login -u admin -p admin123 https://127.0.0.1:8089/repository/alphacar/
#docker login -u admin -p admin123 http://127.0.0.1:8085/repository/alphacar/
#docker login -u admin -p admin123 10.0.0.62:8085
