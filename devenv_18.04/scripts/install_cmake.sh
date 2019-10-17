VER=3.15
CMAKE=cmake-$VER.4-Linux-x86_64.sh

if [ ! -f "$CMAKE" ];then
    echo "file not exists!"
    wget https://cmake.org/files/$VER/$CMAKE
fi

sudo sh $CMAKE --prefix=/usr/local --exclude-subdir
