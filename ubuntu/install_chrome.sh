#!/bin/bash

wget http://www.linuxidc.com/files/repo/google-chrome.list -P /etc/apt/sources.list.d/
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub  | apt-key add -
apt-get update
apt-get install -y google-chrome-stable
