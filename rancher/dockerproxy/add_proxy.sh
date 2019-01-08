#!/bin/bash

#Environment="HTTP_PROXY=http://127.0.0.1:2880/"
#Environment="HTTPS_PROXY=http://127.0.0.1:2880/"

mkdir -p /etc/systemd/system/docker.service.d

echo -e "Environment=\"HTTP_PROXY=http://127.0.0.1:2880/\"\n\
Environment=\"HTTPS_PROXY=http://127.0.0.1:2880/\n\"" \
> /etc/systemd/system/docker.service.d/http-proxy.conf

systemctl daemon-reload 
systemctl restart docker
