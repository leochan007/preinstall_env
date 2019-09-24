1. unzip spark-bin-hadoop

2. pip3 install pyspark

3. write py program

4. executor on k8s

#start process

#lmtest.luomuxinxi.com
#spark-ui.luomuxinxi.com
#47.103.84.242

sbin/stop-master.sh
SPARK_MASTER_HOST=192.168.0.136 SPARK_MASTER_PORT=7077 SPARK_WORKER_CORES=4 nohup ./sbin/start-master.sh &
SPARK_MASTER_HOST=0.0.0.0 SPARK_MASTER_PORT=7077 SPARK_WORKER_CORES=4 nohup ./sbin/start-master.sh &
./sbin/start-master.sh --properties-file conf/spark-defaults.conf

sbin/stop-slave.sh
./sbin/start-slave.sh spark://192.168.0.136:7077 -h 192.168.0.136 -p 7078 --webui-port 8081
./sbin/start-slave.sh spark://0.0.0.0:7077 -h 0.0.0.0 -p 7078 --webui-port 8081
