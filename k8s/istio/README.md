git clone https://github.com/istio/istio

# brew install kubernetes-helm

helm template install/kubernetes/helm/istio --name istio --namespace istio-system \
  --set gateways.istio-ingressgateway.type=NodePort \
  --set ingress.service.type=NodePort \
  > istio.yaml

kubectl create namespace istio-system
kubectl create -f istio.yaml
kubectl delete -f istio.yaml

helm template install/kubernetes/helm/istio --name istio --namespace istio-system \
  --set galley.enabled=false \
  --set ingress.enabled=false \
  --set gateways.istio-ingressgateway.enabled=false \
  --set gateways.istio-egressgateway.enabled=false \
  --set sidecarInjectorWebhook.enabled=false \
  --set mixer.enabled=false \
  --set prometheus.enabled=false \
  --set global.proxy.envoyStatsd.enabled=false > istio-minimal.yaml

kubectl create namespace istio-system
kubectl create -f istio-minimal.yaml
kubectl delete -f istio-minimal.yaml

kubectl get pods -n istio-system

# istioctl kube-inject -f samples/sleep/sleep.yaml | kubectl apply -f -

istioctl kube-inject -f samples/bookinfo/platform/kube/bookinfo.yaml | kubectl apply -f -
kubectl apply -f <(istioctl kube-inject -f samples/bookinfo/platform/kube/bookinfo.yaml)

kubectl apply -f samples/bookinfo/networking/bookinfo-gateway.yaml
kubectl get services

istioctl create -f samples/bookinfo/networking/destination-rule-all.yaml
istioctl replace -f samples/bookinfo/networking/destination-rule-all.yaml

# external LB
export INGRESS_HOST=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
export INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="http")].port}')
export SECURE_INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="https")].port}')

export INGRESS_HOST=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.status.loadBalancer.ingress[0].hostname}')
# Node Port
export INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="http2")].nodePort}')
$ export SECURE_INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="https")].nodePort}')

samples/bookinfo/platform/kube/cleanup.sh

export BOOKINFO_URL=$(kubectl get po -l app=productpage -o jsonpath={.items[0].status.hostIP}):$(kubectl get svc productpage -o jsonpath={.spec.ports[0].nodePort})

kubectl -n istio-system get svc istio-ingressgateway
