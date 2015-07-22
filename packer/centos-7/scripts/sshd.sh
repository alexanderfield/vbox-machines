#!/bin/bash

sed -i 's/^.*UseDNS yes/UseDNS no/' /etc/ssh/sshd_config
