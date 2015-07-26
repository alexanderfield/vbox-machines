#!/bin/bash

if [ "$#" -eq 0 ]; then
    echo "What topic would you like to write to?"
    echo "Available options:"
    k-scripts/list.sh
    read TOPIC
else
    TOPIC="$@"
fi

echo "Ok. Just type something and hit enter to publish to \"$TOPIC\"...(^C to stop)..."
kafka_2.10-0.8.2.1/bin/kafka-console-producer.sh --broker-list 192.168.33.10:9092 --topic $TOPIC
