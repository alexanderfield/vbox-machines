#!/bin/bash

if [ "$#" -eq 0 ]; then
    echo "What topic would you like described?"
    echo "Available options:"
    k-scripts/list.sh
    read TOPIC
else
    TOPIC="$@"
fi

kafka_2.10-0.8.2.1/bin/kafka-topics.sh --describe --zookeeper 192.168.33.10:2181 --topic $TOPIC
