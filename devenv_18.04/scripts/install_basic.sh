#!/bin/bash

sudo apt-get update

sudo apt-get install -y apt-utils vim tzdata python

sudo apt-get install python-pip

sudo apt-get -y build-dep gcc

sudo cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
