#!/bin/bash

source defs.sh

if [ ! -d ${NEXUS_VER} ]; then
    if [ ! -f ${NEXUS_VER}-unix.tar.gz ]; then
        wget http://download.sonatype.com/nexus/3/${NEXUS_VER}-unix.tar.gz
    fi
    tar zxvf ${NEXUS_VER}-unix.tar.gz
fi

rm -rf /opt/${NEXUS_VER}

cp -rf ${NEXUS_VER} /opt
