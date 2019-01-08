#/bin/bash

mkdir db4

cd db4

if [ ! -d db-4.8.30.NC ]; then
    if [ ! -f db-4.8.30.NC.tar.gz ]; then
        wget http://download.oracle.com/berkeley-db/db-4.8.30.NC.tar.gz
    fi
    tar -xzvf db-4.8.30.NC.tar.gz
fi

cd db-4.8.30.NC/build_unix/

../dist/configure --enable-cxx --disable-shared --with-pic --prefix=/home/$USER/bitcoin/db4/

make install

#in bitcoin src dir:
#./configure LDFLAGS="-L/home/$USER/bitcoin/db4/lib/" CPPFLAGS="-I/home/$USER/bitcoin/db4/include/" --prefix=/home/$USER/bitcoin
