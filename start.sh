#!/usr/bin/env bash
set -ex

kafka_args=$@

if [ ! -z $KAFKA_ADVERTISED_LISTENERS ]; then
	kafka_args="--override advertised.listeners=${KAFKA_ADVERTISED_LISTENERS} ${kafka_args}" 
fi

if [ ! -z $KAFKA_LISTENERS ]; then
	kafka_args="--override listeners=${KAFKA_LISTENERS} ${kafka_args}"
fi
if [ ! -z $KAFKA_LOGS ]; then
	kafka_args="--override log.dirs=${KAFKA_LOGS} ${kafka_args}"
fi

bin/zookeeper-server-start.sh config/zookeeper.properties &
sleep 4;
bin/kafka-server-start.sh config/server.properties $kafka_args

