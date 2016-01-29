#!/bin/bash

CONFIG_PROVISION_PATH="/temp/config"

echo "Installing Nginx..."

apt-get install -y nginx

echo "Importing Nginx configuration..."

sudo rm -rf /etc/nginx/sites-enabled/*.* > /dev/null
sudo rm -rf /etc/nginx/sites-available/*.* > /dev/null
sudo rm -rf /etc/nginx/sites-enabled/* > /dev/null
sudo rm -rf /etc/nginx/sites-available/* > /dev/null
sudo rm -rf /etc/nginx/conf.d/*.* > /dev/null
sudo rm -rf /etc/nginx/conf.d/* > /dev/null

sudo cp -ivf $CONFIG_PROVISION_PATH/nginx/serverblock_default.conf /etc/nginx/conf.d/default.conf
chmod 644 /etc/nginx/conf.d/default.conf

if [ "$(ls -A $CONFIG_PROVISION_PATH/nginx/serverblocks)" ]; then
    serverblocks=$(ls $CONFIG_PROVISION_PATH/nginx/serverblocks)
    for serverblock in $serverblocks
    do
        sudo cp -ivf $CONFIG_PROVISION_PATH/nginx/serverblocks/$serverblock /etc/nginx/conf.d/$serverblock
    done
fi
