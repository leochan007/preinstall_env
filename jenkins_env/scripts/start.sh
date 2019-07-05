#!/bin/bash

#get jenkins.war
#wget http://updates.jenkins-ci.org/latest/jenkins.war

#vim /etc/hosts
#127.0.0.1       localhost iZuf66hzcn38yu52b057wyZ

#java -jar jenkins.war

export JENKINS_HOME=/home/jenkins/jenkins_home
export JENKINS_PORT=31180
JENKINS_HOME=/home/jenkins/jenkins_home nohup java -jar jenkins.war --httpPort=31180 &
#java -Dhudson.DNSMultiCast.disabled=true -Dhudson.udp=-1 -jar jenkins.war
