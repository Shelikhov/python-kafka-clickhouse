#!/bin/bash

#==============================================================
#            Script to prepare Clickhouse Database
#==============================================================
#Components:
# - clickhouse-server
# - clickhouse-client
# - Kafka topic (name: test-topic)
# - Tables:
#		- kafka (to get data from kafka)
#		- local-table (to store received data)
#		- consumer (to convert data from kafka and put data to the local-table)


# To add the official repository.
sudo yum-config-manager --add-repo https://packages.clickhouse.com/rpm/clickhouse.repo

# To install clickhouse-server and clickhouse-client.
sudo yum install -y clickhouse-server clickhouse-client

# To start clickhouse-server.
sudo /etc/init.d/clickhouse-server start

# To provide time (10 seconds) to the clickhouse-server to start.
sleep 10

# To create kafka producer as a data stream.
clickhouse-client --query "CREATE TABLE kafka (bid_avg String) ENGINE = Kafka('${kafka_private_ip}:9092', 'test-topic', 'test-group', 'JSONAsString')"

# To create table (local table) to store data.
clickhouse-client --query "CREATE TABLE local (bid String) ENGINE = Memory();"

# To create MATERIALIZED VIEW to convert data from kafka engine and put data to local table.
clickhouse-client --query "CREATE MATERIALIZED VIEW consumer TO local AS SELECT bid_avg AS bid FROM kafka GROUP BY bid;"
