#wget https://archive.apache.org/dist/kafka/2.1.0/kafka_2.12-2.1.0.tgz

tar -xzf kafka_2.12-2.1.0.tgz

cd kafka_2.12-2.1.0

bin/zookeeper-server-start.sh config/zookeeper.properties

bin/kafka-server-start.sh config/server.properties

bin/kafka-topics.sh --create --bootstrap-server 0.0.0.0:9092 --replication-factor 1 --partitions 1 --topic test

bin/kafka-topics.sh --list --bootstrap-server localhost:9092
