#!/bin/bash

CONFIG_PROVISION_PATH="/temp/config"

echo "Installing GIT..."

apt-get install -y git

echo "Configuring GIT..."

cp -vf $CONFIG_PROVISION_PATH/gitconfig /home/vagrant/.gitconfig