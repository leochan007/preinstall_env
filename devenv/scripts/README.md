docker login repo.alphacario.com:8089 -u admin

export NEXUS_DOMAIN=repo.alphacario.com
export NEXUS_IP_ADDRESS=47.103.84.242
keytool -genkeypair -keystore keystore.jks -storepass nexus3 -keypass nexus3 -alias jetty -keyalg RSA -keysize 2048 -validity 5000 -dname "CN=*.${NEXUS_DOMAIN}, OU=Example, O=Sonatype, L=Unspecified, ST=Unspecified, C=US" -ext "SAN=DNS:${NEXUS_DOMAIN},IP:${NEXUS_IP_ADDRESS}" -ext "BC=ca:true"
