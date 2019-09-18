#!/bin/bash

URL=127.0.0.1:8443

PASSWORD=pwd123
TRUST_PATH=~/maven/conf/trust.jks

if [ -n "$1" ]; then
    URL=$1
fi

if [ -n "$2" ]; then
    PASSWORD=$2
fi

STR=${URL/:/_}

echo STR=${STR}

#openssl s_client -connect ${URL} -showcerts </dev/null 2>/dev/null \
#    | openssl x509 -outform PEM | sudo tee /usr/local/share/ca-certificates/${STR}.crt

echo -n | openssl s_client -showcerts -connect ${URL} 2>/dev/null \
| sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' > /usr/local/share/ca-certificates/${STR}.crt

sudo update-ca-certificates
sudo service docker restart
