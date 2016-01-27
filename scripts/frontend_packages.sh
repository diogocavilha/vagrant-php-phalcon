#!/bin/bash

echo "Installing node, npm and bower..."

apt-get install -y nodejs
apt-get install -y npm

if [ ! -e "/usr/bin/node" ]; then
    sudo ln -s "$(which nodejs)" /usr/bin/node
fi

if [ ! -e "/usr/local/bin/bower" ]; then
    sudo npm install -g bower
fi
