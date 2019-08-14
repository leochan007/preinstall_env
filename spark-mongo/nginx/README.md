#compile nginx

#git clone nginx src
git clone -b release-1.17.2 https://github.com/nginx/nginx

cd nginx

git clone git://github.com/yaoweibin/ngx_http_substitutions_filter_module.git

apt-get install -y libpcre3 libpcre3-dev libssl-dev zlib1g-dev

./auto/configure --prefix=/usr/share/nginx --sbin-path=/usr/sbin/nginx --conf-path=/etc/nginx/nginx.conf --error-log-path=/var/log/nginx/error.log --http-log-path=/var/log/nginx/access.log --http-client-body-temp-path=/var/lib/nginx/tmp/client_body --http-proxy-temp-path=/var/lib/nginx/tmp/proxy --http-fastcgi-temp-path=/var/lib/nginx/tmp/fastcgi --http-uwsgi-temp-path=/var/lib/nginx/tmp/uwsgi --http-scgi-temp-path=/var/lib/nginx/tmp/scgi --pid-path=/var/run/nginx.pid --lock-path=/run/lock/subsys/nginx --user=nginx --group=nginx --with-file-aio --with-http_v2_module --with-http_stub_status_module --with-http_ssl_module --with-http_realip_module --with-http_addition_module --with-http_sub_module  --with-http_gunzip_module --with-http_gzip_static_module --with-http_random_index_module --with-http_secure_link_module --with-http_degradation_module --with-http_stub_status_module --add-module=./ngx_http_substitutions_filter_module

sudo vim /lib/systemd/system/nginx.service
