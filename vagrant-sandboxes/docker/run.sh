#!/bin/bash

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

vagrant up --provision
vagrant status

# Test docker is up...
# Docker should be daemonized and remotely available...
# From scratch, will need image(s) before any container(s) can be run...
# Get images by running docker pull <imagename> (ie docker pull centos)...
# Create a container and run a program in it with docker run (ie sudo docker run -it )
