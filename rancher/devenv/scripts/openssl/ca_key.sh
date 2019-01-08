#!/bin/bash

openssl req \
-newkey rsa:4096 -nodes -sha256 -keyout ca.key \
-x509 -days 365 -out ca.crt

openssl req \
-newkey rsa:4096 -nodes -sha256 -keyout demo.alphacario.com.key \
-out  demo.alphacario.com.csr

openssl x509 -req -days 365 -in demo.alphacario.com.csr \
-CA ca.crt -CAkey ca.key -CAcreateserial -out demo.alphacario.com.crt

echo 'subjectAltName = IP:192.168.1.101' > extfile.cnf
openssl x509 -req -days 365 -in demo.alphacario.com.csr \
-CA ca.crt -CAkey ca.key -CAcreateserial -extfile extfile.cnf -out  demo.alphacario.com.crt

#验证
openssl s_client -connect demo.alphacario.com:443 -servername demo.alphacario.com

openssl s_client -connect demo.alphacario.com:443 -servername demo.alphacario.com -CAfile server-ca.crt
