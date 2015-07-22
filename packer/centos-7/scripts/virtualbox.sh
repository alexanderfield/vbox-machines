#!/bin/bash

# required for building kernel module
yum install -y bzip2 gcc make perl kernel-devel-`uname -r` kernel-headers-`uname -r`

mount -o ro,loop /root/VBoxGuestAdditions_*.iso /mnt

export KERN_DIR="/usr/src/kernels/`uname -r`"

cd /mnt
./VBoxLinuxAdditions.run --nox11

cd /
umount /mnt
