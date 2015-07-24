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

DOCKER_FILE=docker-engine-1.7.1-1.el7.centos.x86_64.rpm
DOCKER_FILE_TRUSTED_HASH=de3009d88a0b8a74a9d40a44e2e1101d

if [ ! -f $DOCKER_FILE ];
then
  wget https://get.docker.com/rpm/1.7.1/centos-7/RPMS/x86_64/$DOCKER_FILE
  HASH_TO_TEST="$(md5 -r $DOCKER_FILE | awk '{ print $1}')"
  if [ $HASH_TO_TEST != $DOCKER_FILE_TRUSTED_HASH ]
    then
      echo "Downloaded docker rpm doesn't hash!!"
      rm $DOCKER_FILE
      echo "Downloaded file deleted. Exiting!"
      exit
  fi
fi


# Bring up both boxes...
vagrant up --provision
vagrant status

# test kafka is up...
echo ""
echo "Attempting to setup my-replicated-topic...will error if it already exists..."
kafka_2.10-0.8.2.1/bin/kafka-topics.sh --create --zookeeper 192.168.33.10:2181 --replication-factor 3 --partitions 1 --topic my-replicated-topic

echo ""
echo "Describing my-replicated-topic..."
k-scripts/desc.sh

echo ""
echo "Listing all topics..."
k-scripts/list.sh
