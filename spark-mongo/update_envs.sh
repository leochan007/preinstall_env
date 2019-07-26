#!/bin/bash

FOLDER=test

TMP_CMD='--insecure-skip-tls-verify=true'

NS='--namespace bigdata'

if [ -n "$1" ]; then
    FOLDER=$1
fi

echo 'set-context luomu-dev...'
kubectl config use-context luomu-dev

for item in `ls ./envs/*.env`
do
  tmp=${item##*/}
  name=${tmp%.*}
  if echo $name|grep -qe '^configmap-' ;then
    echo 'get configmap:' $name
    kubectl $TMP_CMD delete configmap $name $NS
    kubectl $TMP_CMD create configmap $name --from-env-file=$item $NS
  fi
  if echo $name|grep -qe '^secret-' ;then
    echo 'get secret:' $name
    kubectl $TMP_CMD delete secret $name $NS
    kubectl $TMP_CMD create secret generic --from-env-file=$item $name $NS
  fi
done
