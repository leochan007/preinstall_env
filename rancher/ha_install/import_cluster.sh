kubectl --kubeconfig=/root/k8s_config/luomu-test.yaml create clusterrolebinding cluster-admin-binding --clusterrole cluster-admin --user admin

kubectl --kubeconfig=/root/k8s_config/luomu-test.yaml apply -f https://rlb.luomutrip.com/v3/import/ttwcqcsc5886r7mcb6kqsz7gptzp2wmbp9jdgc689xwrkpchcfbv8p.yaml