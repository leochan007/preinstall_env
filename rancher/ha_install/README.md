1. kubectl

2. rke
https://github.com/rancher/rke/releases

3. helm
https://helm.sh/docs/using_helm/#installing-helm


# tips: 变更防火墙配置

## Install Kubernetes with RKE
rke up --config ./rancher-cluster.yml

## Initialize Helm (Install Tiller)
# start helm
kubectl --kubeconfig=/root/ha_install/kube_config_rancher-cluster.yml -n kube-system create serviceaccount tiller

kubectl --kubeconfig=/root/ha_install/kube_config_rancher-cluster.yml create clusterrolebinding tiller \
  --clusterrole=cluster-admin \
  --serviceaccount=kube-system:tiller --upgrade

# helm for aliyun
helm init --service-account tiller \
--tiller-image registry.cn-hangzhou.aliyuncs.com/google_containers/tiller --upgrade

# test helm
kubectl --kubeconfig=/root/ha_install/kube_config_rancher-cluster.yml -n kube-system  rollout status deploy/tiller-deploy

# troubleshooting

kubectl get pod --all-namespaces|grep tiller|awk '{print $2}' |xargs kubectl -n kube-system describe pod

kubectl edit deploy tiller-deploy -n kube-system
# change image name
image: sapcc/tiller:v2.14.3


##  Install Rancher
helm repo add rancher-stable https://releases.rancher.com/server-charts/stable

helm install rancher-stable/rancher \
  --name rancher \
  --namespace cattle-system \
  --set hostname=rlb.luomutrip.com \
  --set tls=external