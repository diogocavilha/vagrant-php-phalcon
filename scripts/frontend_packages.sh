#!/bin/bash

echo "Installing nodejs..."
apt-get install -y nodejs
sudo ln -sf "$(which nodejs)" /usr/bin/node

echo "Installing npm..."
apt-get install -y npm > /dev/null

echo "Installing bower..."
sudo npm install -g bower > /dev/null

echo "Installing gulp..."
sudo npm install -g gulp > /dev/null