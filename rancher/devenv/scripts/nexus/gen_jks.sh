#!/bin/bash

source defs.sh

#ip addr|grep eth0|grep inet|awk -F ' ' '{print $2}'|awk -F '/' '{print $1}'

NEXUS_DOMAIN=nexus.alphacario.com
NEXUS_IP_ADDRESS=127.0.0.1
PASSWD=pwd123

if [ -n "$1" ]; then
    NEXUS_DOMAIN=$1
fi

if [ -n "$2" ]; then
    NEXUS_IP_ADDRESS=$2
fi

if [ -n "$3" ]; then
    PASSWD=$3
fi

echo 'NEXUS_DOMAIN='${NEXUS_DOMAIN}
echo 'NEXUS_IP_ADDRESS='${NEXUS_IP_ADDRESS}

rm -rf keystore.*

keytool -genkeypair -keystore keystore.jks -storepass ${PASSWD} -keypass ${PASSWD} \
 -alias nexus -keyalg RSA -keysize 2048 -validity 5000 \
 -dname "CN=${NEXUS_DOMAIN}, OU=Nexus, O=Nexus, L=Shanghai, ST=Shanghai, C=CN" \
 -ext "SAN=IP:${NEXUS_IP_ADDRESS}" -ext "BC=ca:true"

keytool -export -alias nexus -keystore keystore.jks -file keystore.cer -storepass ${PASSWD}
cp -rf keystore.* /opt/${NEXUS_VER}/etc/ssl/
sudo bash -c 'sed "s/password/pwd123/g" jetty-https.xml > /opt/'${NEXUS_VER}'/etc/jetty/jetty-https.xml'
cp -rf nexus-default.properties /opt/${NEXUS_VER}/etc/

/opt/${NEXUS_VER}/bin/nexus restart

sleep 3

/opt/${NEXUS_VER}/bin/nexus status

# openssl s_client -connect 10.0.0.59:8443 -showcerts </dev/null 2>/dev/null | openssl x509 -outform PEM | sudo tee /usr/local/share/ca-certificates/10.0.0.59.crt
# openssl s_client -connect 47.101.141.142:8443 -showcerts </dev/null 2>/dev/null | openssl x509 -outform PEM | sudo tee /usr/local/share/ca-certificates/10.0.0.59.crt
# sudo update-ca-certificates
# sudo service docker restart

# openssl s_client -connect 10.0.0.59:8443 -showcerts </dev/null 2>/dev/null | openssl x509 -outform DER | tee keystore.cer
