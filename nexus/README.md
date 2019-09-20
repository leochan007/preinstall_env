keytool -genkeypair -keystore keystore.jks -storepass nexus3 -alias luomutrip.com \
 -keyalg RSA -keysize 2048 -validity 5000 -keypass nexus3 \
 -dname 'CN=*.luomutrip.com, OU=Sonatype, O=Sonatype, L=Unspecified, ST=Unspecified, C=US'
