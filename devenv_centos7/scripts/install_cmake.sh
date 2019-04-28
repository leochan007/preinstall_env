VER=3.14
CMAKE=cmake-$VER.2-Linux-x86_64.sh

wget https://cmake.org/files/v3.14/$CMAKE
sudo sh $CMAKE --prefix=/usr/local --exclude-subdir
