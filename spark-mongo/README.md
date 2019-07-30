1. unzip spark-bin-hadoop

2. pip3 install pyspark

3. write py program

4. executor on k8s



#start process

#lmtest.alphacario.com
#47.103.84.242

SPARK_MASTER_HOST=192.168.0.136 SPARK_MASTER_PORT=7077 SPARK_WORKER_CORES=2 ./start-master.sh

./start-slave.sh spark://192.168.0.136:7077
