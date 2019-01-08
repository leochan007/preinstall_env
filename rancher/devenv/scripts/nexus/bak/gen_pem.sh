#!/bin/bash

#keytool -printcert -rfc -sslserver 10.0.0.59:8089 > /etc/docker/cert.d/10.0.0.59:8089/repo.pem

sudo mkdir -p /etc/nginx/ssl

sudo openssl req -x509 -nodes -days 36500 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt
