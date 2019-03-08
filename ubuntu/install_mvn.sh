#!/bin/bash

FN=apache-maven-3.5.4

CUR_ROOT=/home/$USER

rm -rf $FN

if [ ! -f $FN-bin.tar.gz ]; then
    wget https://archive.apache.org/dist/maven/maven-3/3.5.4/binaries/$FN-bin.tar.gz
fi

tar -xvf $FN-bin.tar.gz

rm -rf $CUR_ROOT/maven

cp -rf $FN $CUR_ROOT/maven

echo 'CUR_ROOT:'$CUR_ROOT

echo 'export PATH='$CUR_ROOT'/maven/bin:$PATH' >> $CUR_ROOT/.bashrc

rm -rf $CUR_ROOT/maven

cp -rf $FN $CUR_ROOT/maven

rm -rf $FN

sudo echo 'export PATH='$CUR_ROOT'/maven/bin:$PATH' >> $CUR_ROOT/.bashrc

#cp -f settings.xml $CUR_ROOT/maven/conf/settings.xml
