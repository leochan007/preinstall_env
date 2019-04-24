VER=3.14
CMAKE=cmake-$VER.2-Linux-x86_64.sh

if [ ! -f "$CMAKE" ];then
    echo "file not exists!"
    wget https://cmake.org/files/v3.14/$CMAKE
fi

sudo sh $CMAKE --prefix=/usr/local --exclude-subdir
