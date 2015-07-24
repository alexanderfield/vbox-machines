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

fi

cd vagrant/sandbox-kafka-docker
./run.sh
cd -
