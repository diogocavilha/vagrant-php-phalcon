#!/bin/bash

CONFIG_PROVISION_PATH="/temp/config"

echo "Installing GIT..."

apt-get install -y git
apt-get install -y git-core

echo "Configuring GIT..."

if [ ! -e "/home/vagrant/.gitconfig" ]; then
    rm /home/vagrant/.gitconfig > /dev/null
fi
cp -iv $CONFIG_PROVISION_PATH/gitconfig /home/vagrant/.gitconfig