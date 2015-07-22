#!/bin/bash

sed -i '/UUID/d' /etc/sysconfig/network-scripts/ifcfg-e*
sed -i '/HWADDR/d' /etc/sysconfig/network-scripts/ifcfg-e*

cd /etc
> ./resolv.conf

cd /tmp
find . -type f | xargs shred -uv 

cd /var/lib/systemd
shred -uv ./random-seed

cd /var/log
> wtmp
> cron
> dmesg
> dmesg.old
> lastlog
> secure
> messages
> maillog

cd /root
shred -uv .lesshst .bash_history
