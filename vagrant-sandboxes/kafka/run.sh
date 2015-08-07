#!/bin/bash

KAFKA_V=kafka_2.10-0.8.2.1
KAFKA_FILE_TRUSTED_HASH=446eab1f5329eb03662926aa1cb0845d

if [ ! -d $KAFKA_V ];
then
  wget http://mirrors.gigenet.com/apache/kafka/0.8.2.1/$KAFKA_V.tgz

  HASH_TO_TEST="$(md5 -r $KAFKA_V.tgz | awk '{ print $1}')"
  if [ $HASH_TO_TEST != $KAFKA_FILE_TRUSTED_HASH ]
  then
    echo "Downloaded kafka tarball doesn't hash!!"
    rm $KAFKA_V.tgz
    echo "Downloaded file deleted. Exiting!"
    exit
  fi

  tar -xvf kafka_2.10-0.8.2.1.tgz
  rm kafka_2.10-0.8.2.1.tgz

fi

# Bring up kafka...
vagrant up --provision
vagrant status

# test kafka is up...
echo ""
echo "Attempting to setup my-replicated-topic...will error if it already exists..."
kafka_2.10-0.8.2.1/bin/kafka-topics.sh --create --zookeeper 192.168.33.10:2181 --replication-factor 3 --partitions 1 --topic my-replicated-topic

echo ""
echo "Describing my-replicated-topic..."
echo "my-replicated-topic" | k-scripts/desc.sh

echo ""
echo "Listing all topics..."
k-scripts/list.sh
