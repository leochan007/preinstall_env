VER=3.15.4
CMAKE=cmake-$VER-Linux-x86_64.sh

if [ ! -f "$CMAKE" ];then
    echo "file not exists!"
    wget https://github.com/Kitware/CMake/releases/download/v$VER/$CMAKE
fi

sudo sh $CMAKE --prefix=/usr/local --exclude-subdir
