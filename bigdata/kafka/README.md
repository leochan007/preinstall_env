
#2.1.0

#wget https://archive.apache.org/dist/kafka/2.1.0/kafka_2.12-2.1.0.tgz

tar -xzf kafka_2.12-2.1.0.tgz

cd kafka_2.12-2.1.0

bin/zookeeper-server-start.sh config/zookeeper.properties &
bin/zookeeper-server-stop.sh config/zookeeper.properties

bin/kafka-server-start.sh config/server.properties &
bin/kafka-server-stop.sh config/server.properties

bin/kafka-topics.sh --zookeeper 0.0.0.0:2181 --replication-factor 1 --partitions 1 --create --topic test

#2.3.0

#wget https://archive.apache.org/dist/kafka/2.3.0/kafka_2.12-2.3.0.tgz

tar -xzf kafka_2.12-2.3.0.tgz

cd kafka_2.12-2.3.0

nohup /opt/kafka_2.12-2.3.0/bin/zookeeper-server-start.sh /opt/kafka_2.12-2.3.0/config/zookeeper.properties &
/opt/kafka_2.12-2.3.0/bin/zookeeper-server-stop.sh /opt/kafka_2.12-2.3.0/config/zookeeper.properties

nohup /opt/kafka_2.12-2.3.0/bin/kafka-server-start.sh /opt/kafka_2.12-2.3.0/config/server.properties &
/opt/kafka_2.12-2.3.0/bin/kafka-server-stop.sh /opt/kafka_2.12-2.3.0/config/server.properties
#advertised.host.name=spark-ui.luomutrip.com

/opt/kafka_2.12-2.3.0/bin/kafka-topics.sh --bootstrap-server 0.0.0.0:9092 --replication-factor 1 --partitions 1 --create --topic test

/opt/kafka_2.12-2.3.0/bin/kafka-topics.sh --bootstrap-server 0.0.0.0:9092 --list
/opt/kafka_2.12-2.3.0/bin/kafka-topics.sh --bootstrap-server spark-ui.luomutrip.com:9092 --list

/opt/kafka_2.12-2.3.0/bin/kafka-topics.sh --bootstrap-server 0.0.0.0:9092 --delete --topic __consumer_offsets
/opt/kafka_2.12-2.3.0/bin/kafka-topics.sh --bootstrap-server 0.0.0.0:9092 --delete --topic test

#consumer-groups
/opt/kafka_2.12-2.3.0/bin/kafka-consumer-groups.sh --bootstrap-server spark-ui.luomutrip.com:9092 --list
/opt/kafka_2.12-2.3.0/bin/kafka-consumer-groups.sh --zookeeper 0.0.0.0:2181 --list
/opt/kafka_2.12-2.3.0/bin/kafka-consumer-groups.sh --bootstrap-server spark-ui.luomutrip.com:9092 --describe --group test_console
/opt/kafka_2.12-2.3.0/bin/kafka-consumer-groups.sh --bootstrap-server spark-ui.luomutrip.com:9092 --reset-offsets --all-topics --to-earliest --execute --group test_console
/opt/kafka_2.12-2.3.0/bin/kafka-consumer-groups.sh --bootstrap-server spark-ui.luomutrip.com:9092 --reset-offsets --all-topics --to-earliest --execute --all-groups

