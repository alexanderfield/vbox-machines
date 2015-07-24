# Check pre-req's...
if [ 0 -eq $(which virtualbox | wc | awk '{ print $1}') ]
  then
    echo "VirtualBox not found. Go to https://www.virtualbox.org to install."
    exit
fi

if [ 0 -eq $(which packer | wc | awk '{ print $1}') ]
  then
    echo "Packer not found. Go to https://www.packer.io to install."
    exit
fi

if [ 0 -eq $(which vagrant | wc | awk '{ print $1}') ]
  then
    echo "Vagrant not found. Go to https://www.vagrantup.com to install."
    exit
fi

VAGRANT_DIR="$HOME/Projects/resources/packaged-vagrant-boxes"
CENTOS_VAGRANT_BOX="$VAGRANT_DIR/centos-7-1503-01-minimal.box"

if [ ! -d $VAGRANT_DIR ];
  then
    echo "Vagrant directory not found ($VAGRANT_DIR)"
    echo "Creating directory to house vagrant ready .box files..."
    mkdir -p $VAGRANT_DIR
    echo "Created $VAGRANT_DIR"
fi

if [ ! -f $CENTOS_VAGRANT_BOX ];
  then
    echo "Base CentOS box not found ($CENTOS_VAGRANT_BOX)"
    echo "Creating base box using packer.io..."
    cd packer/centos-7
    packer build centos7-packer.json
    mv packer-vagrant-centos-7-1503-01-minimal.box $VAGRANT_DIR/centos-7-1503-01-minimal.box
    exit
fi

cd vagrant/sandbox-kafka-docker
./run.sh
