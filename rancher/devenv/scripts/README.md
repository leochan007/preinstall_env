docker ps -a|grep rancher/rancher-agent|awk '{print $1}'|xargs docker stop

docker ps -a|grep rancher/rancher-agent|awk '{print $1}'|xargs docker rm -v

sudo rm /etc/kubernetes/.tmp/ -rf

sudo rm -rf /etc/kubernetes/*
sudo rm -rf /var/lib/etcd/*
sudo rm -rf /etc/cni/*
sudo rm -rf /opt/cni/*
sudo rm -rf /var/run/calico/*

sudo docker stop $(sudo docker ps -aq) && sudo docker  rm -v $(sudo docker ps -aq)

sudo docker run -v $PWD/var/lib/rancher:/var/lib/rancher -d --restart=unless-stopped \
  -p 18080:80 -p 18443:443 \
  -v /var/log/auditlog:/var/log/auditlog \
  -e AUDIT_LEVEL=3 \
  -e AUDIT_LOG_PATH=/var/log/auditlog/rancher-api-audit.log \
  -e AUDIT_LOG_MAXAGE=20 \
  -e AUDIT_LOG_MAXBACKUP=20 \
  -e AUDIT_LOG_MAXSIZE=100 \
  rancher/rancher:stable

sudo docker run --volumes-from rancher-data -d --restart=unless-stopped \
  -p 18080:80 -p 18443:443 \
  -v /var/log/auditlog:/var/log/auditlog \
  -e AUDIT_LEVEL=3 \
  -e AUDIT_LOG_PATH=/var/log/auditlog/rancher-api-audit.log \
  -e AUDIT_LOG_MAXAGE=20 \
  -e AUDIT_LOG_MAXBACKUP=20 \
  -e AUDIT_LOG_MAXSIZE=100 \
  rancher/rancher:stable
