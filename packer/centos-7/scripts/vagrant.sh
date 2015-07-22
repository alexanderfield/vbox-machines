#!/bin/bash

useradd -m -G wheel vagrant
echo vagrant | passwd vagrant --stdin
echo "%vagrant ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/vagrant
chmod 400 /etc/sudoers.d/vagrant
sed -i 's/requiretty/!requiretty/' /etc/sudoers
sed -i 's/XAUTHORITY/XAUTHORITY SSH_AUTH_SOCK/' /etc/sudoers
mkdir -m 0700 /home/vagrant/.ssh
curl -s https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub > /home/vagrant/.ssh/authorized_keys
chown -R vagrant:vagrant /home/vagrant/
chmod 0600 /home/vagrant/.ssh/authorized_keys
