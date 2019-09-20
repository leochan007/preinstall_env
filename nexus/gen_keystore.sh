PASSWD=nexus3
DOMAIN=luomutrip.com

keytool -genkeypair -keystore keystore.jks -storepass ${PASSWD} -alias $DOMAIN \
 -keyalg RSA -keysize 2048 -validity 5000 -keypass ${PASSWD} \
 -dname 'CN=*.'$DOMAIN', OU=Sonatype, O=Sonatype, L=Unspecified, ST=Unspecified, C=US'
