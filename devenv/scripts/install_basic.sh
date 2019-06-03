#!/bin/bash

sudo apt-get update

sudo apt-get install -y python-software-properties

sudo apt-get install -y apt-utils vim tzdata make python3-pip

sudo cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
