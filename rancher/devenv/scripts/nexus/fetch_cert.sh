#!/bin/bash

URL=127.0.0.1:8443

if [ -n "$1" ]; then
    URL=$1
fi

STR=${URL/:/_}

echo STR=${STR}

openssl s_client -connect ${URL} -showcerts </dev/null 2>/dev/null \
    | openssl x509 -outform PEM | sudo tee /usr/local/share/ca-certificates/${STR}.crt

sudo update-ca-certificates
sudo service docker restart

#mkdir -p ~/.docker/certs.d/nexus.alphacario.com:8089/
#keytool -printcert -sslserver nexus.alphacario.com:8089 -rfc
