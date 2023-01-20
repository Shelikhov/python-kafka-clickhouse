#!/bin/bash

#======================================================
#               Script to prepare Kafka
#======================================================
#Components:
# - Java 11
# - Kafka (2.13-3.3.1 stable version)
# - Kafka topic (name: test-topic)


# To install JAVA 11 for Zookeeper.
sudo yum install java-11-amazon-corretto-headless -y

# To download and unzip kafka files.
wget https://downloads.apache.org/kafka/3.3.1/kafka_2.13-3.3.1.tgz
tar xzf kafka_2.13-3.3.1.tgz
rm -rf kafka_2.13-3.3.1.tgz

# To uncomment advertised.listeners parameter in kafka config file, so that clients can correctly connect to it.
sed -i "s|\#advertised.listeners=PLAINTEXT:\/\/your.host.name\:9092|advertised.listeners=PLAINTEXT\:\/\/$(curl http://169.254.169.254/latest/meta-data/public-ipv4)\:9092|" kafka_2.13-3.3.1/config/server.properties

# curl http://169.254.169.254/latest/meta-data/public - to get host public IP v4 address

# To start zookeeper.
nohup ./kafka_2.13-3.3.1/bin/zookeeper-server-start.sh -daemon kafka_2.13-3.3.1/config/zookeeper.properties

# To start kafka server.
nohup ./kafka_2.13-3.3.1/bin/kafka-server-start.sh -daemon kafka_2.13-3.3.1/config/server.properties

# To create kafka topic.
./kafka_2.13-3.3.1/bin/kafka-topics.sh --create --topic test-topic --bootstrap-server localhost:9092
