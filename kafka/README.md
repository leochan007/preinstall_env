
#2.1.0

#wget https://archive.apache.org/dist/kafka/2.1.0/kafka_2.12-2.1.0.tgz

tar -xzf kafka_2.12-2.1.0.tgz

cd kafka_2.12-2.1.0

bin/zookeeper-server-start.sh config/zookeeper.properties &
bin/zookeeper-server-stop.sh config/zookeeper.properties

bin/kafka-server-start.sh config/server.properties &
bin/kafka-server-stop.sh config/server.properties

bin/kafka-topics.sh --zookeeper 0.0.0.0:2181 --replication-factor 1 --partitions 1 --create --topic test

#2.2.0， 2.3.0

#wget https://archive.apache.org/dist/kafka/2.3.0/kafka_2.12-2.3.0.tgz

tar -xzf kafka_2.12-2.3.0.tgz

cd kafka_2.12-2.3.0

bin/zookeeper-server-start.sh config/zookeeper.properties &
bin/zookeeper-server-stop.sh config/zookeeper.properties

bin/kafka-server-start.sh config/server.properties &
bin/kafka-server-stop.sh config/server.properties
#advertised.host.name=spark-ui.luomuxinxi.com

bin/kafka-topics.sh --bootstrap-server 0.0.0.0:9092 --replication-factor 1 --partitions 1 --create --topic test

bin/kafka-topics.sh --bootstrap-server 0.0.0.0:9092 --list
bin/kafka-topics.sh --bootstrap-server spark-ui.luomuxinxi.com:9092 --list

bin/kafka-topics.sh --bootstrap-server 0.0.0.0:9092 --delete --topic __consumer_offsets
bin/kafka-topics.sh --bootstrap-server 0.0.0.0:9092 --delete --topic test
