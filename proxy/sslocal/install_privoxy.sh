sudo pip install --upgrade pip

sudo pip install shadowsocks

sudo apt-get install -y privoxy

#nohup sslocal -c config.json &

#sudo vim /etc/privoxy/config
#listen-address localhost:8118
#forward-socks5 / 127.0.0.1:28000 . 

sudo /etc/init.d/privoxy restart
