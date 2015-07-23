#!/bin/bash
if [ ! -d "kafka_2.10-0.8.2.1" ];
then
  wget http://mirrors.gigenet.com/apache/kafka/0.8.2.1/kafka_2.10-0.8.2.1.tgz
  tar -xvf kafka_2.10-0.8.2.1.tgz
  rm kafka_2.10-0.8.2.1.tgz
fi

if [ ! -f "docker-engine-1.7.1-1.el7.centos.x86_64.rpm" ];
then
  wget https://get.docker.com/rpm/1.7.1/centos-7/RPMS/x86_64/docker-engine-1.7.1-1.el7.centos.x86_64.rpm
fi

vagrant up
vagrant status

vagrant provision kafka
# test kafka is up...
echo ""
echo "Attempting to setup my-replicated-topic...will error if it already exists..."
kafka_2.10-0.8.2.1/bin/kafka-topics.sh --create --zookeeper 192.168.33.10:2181 --replication-factor 3 --partitions 1 --topic my-replicated-topic

echo ""
echo "Describing my-replicated-topic..."
kafka-scripts/desc.sh

echo ""
echo "Listing all topics..."
kafka-scripts/list.sh
