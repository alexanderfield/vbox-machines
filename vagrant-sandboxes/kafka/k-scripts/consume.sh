#!/bin/bash

if [ "$#" -eq 0 ]; then
    echo "What topic would you like to read from?"
    echo "Available options:"
    k-scripts/list.sh
    read TOPIC
else
    TOPIC="$@"
fi

echo "Ok. Here are all the messages --from-beginning of \"$TOPIC\"...(^C to stop consuming)..."
kafka_2.10-0.8.2.1/bin/kafka-console-consumer.sh --zookeeper 192.168.33.10:2181 --from-beginning --topic $TOPIC
