#!/bin/bash

 # 删除所有容器

#docker rm -f $(docker ps -qa)

# 删除所有容器卷

#docker volume rm $(docker volume ls -q)

# 删除残留路径

rm -rf /etc/ceph  /etc/cni /opt/cni  /run/secrets/kubernetes.io  /run/calico  /run/flannel  /var/lib/calico  /var/lib/cni  /var/lib/kubelet  /var/log/containers  /var/log/pods  /var/run/calico

# 清理网络接口

network_interface=`ls /sys/class/net`

for net_inter in $network_interface;

do

    if ! echo $net_inter | grep -qiE 'lo|docker0|eth*|ens*';then

        ip link delete $net_inter

    fi 
done

# 清理残留进程

port_list=`80 443 6443 2376 2379 2380 8472 9099 10250 10254`

for port in $port_list

do

    pid=`netstat -atlnup|grep $port |awk '{print $7}'|awk -F '/' '{print $1}'|grep -v -|sort -rnk2|uniq`

   if [[ -n $pid ]];then

          kill -9 $pid

   fi

done

pro_pid=`ps -ef |grep -v grep |grep kube|awk '{print $2}'`

if [[ -n $pro_pid ]];then

    kill -9 $pro_pid

fi
