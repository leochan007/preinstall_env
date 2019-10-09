keytool -genkeypair -keystore keystore.jks -storepass nexus3 -alias luomutrip.com \
 -keyalg RSA -keysize 2048 -validity 5000 -keypass nexus3 \
 -dname 'CN=*.luomutrip.com, OU=Sonatype, O=Sonatype, L=Unspecified, ST=Unspecified, C=US'

#restore password
connect plocal:/opt/nexus/sonatype-work/nexus3/db/security admin admin

update user SET password="$shiro1$SHA-512$1024$NE+wqQq/TmjZMvfI7ENh/g==$V4yPw8T64UQ6GfJfxYq2hLsVrBY8D1v+bktfOxGdt4b/9BthpWPNUy/CBk6V9iA0nHpzYzJFWO8v/tZFtES8CA==" UPSERT WHERE id="admin"
