#!/bin/bash

cd ~

tar -zcvf jenkins_backup.tar.gz --exclude=.jenkins/logs --exclude=.jenkins/workspace ~/.jenkins
