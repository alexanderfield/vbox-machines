#!/bin/bash

yum clean all

echo "running dd if=/dev/zero of=/deleteme to fill up free space for compacting optimization"
echo "THIS MIGHT TAKE AWHILE TO COMPLETE"
cd /
dd if=/dev/zero of=/deleteme bs=1M
rm -f /deleteme

# remove packer /tmp/script.sh as last step
rm -rf /tmp/script.sh
