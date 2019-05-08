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

openssl s_client -connect ${URL} -showcerts </dev/null 2>/dev/null \
    | openssl x509 -outform PEM | sudo tee /usr/local/share/ca-certificates/${STR}.crt

#echo ${PASSWORD} | sudo keytool -delete -alias mavensrv -keystore ${TRUST_PATH}

#keytool -v -alias mavensrv -import -file /usr/local/share/ca-certificates/${STR}.crt \
# -keystore ${TRUST_PATH}

#JAVA_HOME=/usr/lib/jvm/java-8-oracle

#echo 'security folder='${JAVA_HOME}/lib/security

#keytool -printcert -rfc -sslserver ${URL} > ${URL}.pem

#echo 'try print pem file:'

#keytool -printcert -file ${URL}.pem

#echo 'end of pem file'

#mkdir -p ${JAVA_HOME}/lib/security

#keytool -delete -alias ${URL} -keystore ${JAVA_HOME}/lib/security/cacerts
#keytool -importcert -file ${URL}.pem -alias ${URL} -storepass ${PASSWORD} \
#-keystore ${JAVA_HOME}/lib/security/cacerts

#cp -f .mavenrc ~/

sudo update-ca-certificates
sudo service docker restart
