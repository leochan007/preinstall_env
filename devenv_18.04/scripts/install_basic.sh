#!/bin/bash

sudo apt-get update

sudo apt-get install --allow-remove-essential -y apt-utils vim tzdata make python3-pip python-pip

sudo cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
