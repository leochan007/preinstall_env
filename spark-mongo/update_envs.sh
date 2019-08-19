#!/bin/bash

FOLDER=test

TMP_CMD='--insecure-skip-tls-verify=true'

NS='--namespace bigdata'

if [ -n "$1" ]; then
    FOLDER=$1
fi

echo 'set-context luomu-test...'
#kubectl config use-context luomu-test

for item in `ls ./envs/*.env`
do
  tmp=${item##*/}
  name=${tmp%.*}
  if echo $name|grep -qe '^configmap-' ;then
    echo 'get configmap:' $name
    kubectl --kubeconfig=/root/k8s_config/luomu-test.yaml $TMP_CMD delete configmap $name $NS
    kubectl --kubeconfig=/root/k8s_config/luomu-test.yaml $TMP_CMD create configmap $name --from-env-file=$item $NS
  fi
  if echo $name|grep -qe '^secret-' ;then
    echo 'get secret:' $name
    kubectl --kubeconfig=/root/k8s_config/luomu-test.yaml $TMP_CMD delete secret $name $NS
    kubectl --kubeconfig=/root/k8s_config/luomu-test.yaml $TMP_CMD create secret generic --from-env-file=$item $name $NS
  fi
done
