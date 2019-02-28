#!/bin/bash

pip install supervisor shadowsocks

mkdir -p /etc/supervisor/conf.d
echo_supervisord_conf > /etc/supervisor/supervisord.conf
sed -i "s/;\[include\]/\[include\]/g" /etc/supervisor/supervisord.conf
echo "files = conf.d/*.conf" >>  /etc/supervisor/supervisord.conf
sed -i "s/;files[[:space:]]=[[:space:]]relative\/directory\/*.ini/;files[[:space:]]=[[:space:]]conf.d\/*.conf/g" /etc/supervisor/supervisord.conf
