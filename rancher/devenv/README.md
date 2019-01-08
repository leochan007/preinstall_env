## title

sudo docker ps -a | awk -F ' ' '{print $1}' |xargs sudo docker stop && echo y | sudo docker system prune


sudo docker images |grep none |awk -F ' ' '{print $3}'|xargs sudo docker rmi 



Inbound rules
Type	Protocol	Port Range	Source
SSH	TCP	22	0.0.0.0/0
HTTP	TCP	80	0.0.0.0/0
Custom TCP Rule	TCP	443	0.0.0.0/0
Custom TCP Rule	TCP	2376	0.0.0.0/0
Custom TCP Rule	TCP	2379-2380	sg-xxx (rancher-nodes)
Custom UDP Rule	UDP	4789	sg-xxx (rancher-nodes)
Custom TCP Rule	TCP	6443	0.0.0.0/0
Custom UDP Rule	UDP	8472	sg-xxx (rancher-nodes)
Custom TCP Rule	TCP	10250-10252	sg-xxx (rancher-nodes)
Custom TCP Rule	TCP	10256	sg-xxx (rancher-nodes)
Custom TCP Rule	TCP	30000-32767	0.0.0.0/0
Custom UDP Rule	UDP	30000-32767	0.0.0.0/0

Outbound rules
Type	Protocol	Port Range	Destination
All traffic	All	All	0.0.0.0/0
