#!/bin/bash

set -x

BACKUP_DIR=backup
RANCHER_TAG="rancher/rancher:stable"
contain_id=`docker ps -a | grep rancher/rancher:stable | awk -F ' ' '{print $1}'`
container_name=`docker ps -a --format '{{.Image}} {{.Names}} {{.Status}}' | grep rancher/rancher:stable | awk '{print $2}'`
echo 'contain_id: '${contain_id}
echo 'container_name: '${container_name}

docker start ${contain_id}

sleep 3

rancher_ver=`docker exec -i ${contain_id} bash -c "rancher --version" | awk '{print $3}'`

rancher_hash=`docker images | grep "rancher/rancher" | grep "stable" | awk '{print $3}'`

echo 'rancher_ver: '${rancher_ver}
echo 'rancher_hash: '${rancher_hash}

if [ ! -d ${BACKUP_DIR} ]; then
  mkdir -p ${BACKUP_DIR}
fi

docker stop ${contain_id}

docker stop rancher-data && docker rm -v rancher-data

docker create --volumes-from ${container_name} --name rancher-data ${RANCHER_TAG}

rm -f $PWD/${BACKUP_DIR}/rancher-data-backup-${rancher_ver}-${rancher_hash}.tar.gz

docker run --volumes-from rancher-data -v $PWD/${BACKUP_DIR}:/${BACKUP_DIR} alpine \
  sh -c "rm -rf /var/lib/rancher/management-state/catalog-controller/cache/* \
  && tar zcvf /${BACKUP_DIR}/rancher-data-backup-${rancher_ver}-${rancher_hash}.tar.gz /var/lib/rancher"

docker pull rancher/rancher:stable

#docker start ${contain_id}

#var/lib/rancher/management-state/catalog-controller/cache
