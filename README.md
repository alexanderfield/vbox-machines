# vbox-machines

Toy virtualization project.

Start by running ./run.sh

This script will:

1) Create a minimal CentOS image using packer.io [1]

2) Spin up two vagrant [2] boxes, one running Kafka, and another running docker.

Note: Vagrant requires VirtualBox [3].
The script will check for pre-req's and prompt as needed.

[1] https://www.packer.io

[2] https://www.vagrantup.com

[3] https://www.virtualbox.org
