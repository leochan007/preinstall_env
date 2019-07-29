#!/bin/bash

# --conf spark.app.name=demo-py-test \
spark-submit \
    --master k8s://https://lmtest.alphacario.com/k8s/clusters/c-dkpc4 \
    --deploy-mode cluster \
    --name demo-py \
    --conf spark.kubernetes.namespace=bigdata \
    --conf spark.executor.instances=1 \
    --conf spark.kubernetes.container.image=leochan007/spark-py:v2.4.3 \
    local:///opt/spark/examples/src/main/python/pi.py 1000
