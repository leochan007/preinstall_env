#/bin/bash

sudo yum -y groupinstall "Development tools"
sudo yum -y install zlib-devel bzip2-devel openssl-devel ncurses-devel \
sqlite-devel readline-devel tk-devel gdbm-devel db4-devel libpcap-devel xz-devel libffi-devel

filename=Python-3.7.4.tar.xz

if [ ! -f "$filename" ]; then
    wget https://www.python.org/ftp/python/3.7.4/$filename
fi

tar xvJf $filename

cd Python-3.7.4
./configure --prefix=/usr/local/python37 --enable-universalsdk --enable-shared
sudo make && sudo make install

sudo bash -c "echo '/usr/local/python37/lib' > /etc/ld.so.conf.d/python3.7.conf"
sudo ldconfig
