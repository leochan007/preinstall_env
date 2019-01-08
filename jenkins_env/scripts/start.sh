#!/bin/bash

#get jenkins.war
#wget http://updates.jenkins-ci.org/latest/jenkins.war

#vim /etc/hosts
#127.0.0.1       localhost iZuf66hzcn38yu52b057wyZ

#java -jar jenkins.war

nohup java -jar jenkins.war &
#java -Dhudson.DNSMultiCast.disabled=true -Dhudson.udp=-1 -jar jenkins.war
