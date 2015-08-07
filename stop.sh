#!/bin/bash

# Kafka, Docker, and Hadoop are now broken out to their own projects
echo "Stopping kafka..."
cd vagrant-sandboxes/kafka
vagrant halt

echo "Stopping docker..."
cd ../docker
vagrant halt

echo "Stopping hadoop..."
cd ../hadoop
vagrant halt
