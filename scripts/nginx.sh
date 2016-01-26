#!/bin/bash

CONFIG_PROVISION_PATH="/temp/config"

echo "Installing Nginx..."

apt-get install -y nginx

echo "Importing Nginx configuration..."

if [ -e "/etc/nginx/sites-enabled/default" ]; then
    rm /etc/nginx/sites-enabled/default > /dev/null
fi

if [ -e "/etc/nginx/sites-available/default" ]; then
    rm /etc/nginx/sites-available/default > /dev/null
fi

if [ -e "/etc/nginx/conf.d/default" ]; then
    rm /etc/nginx/conf.d/default > /dev/null
fi

if [ -e "/etc/nginx/conf.d/default.conf" ]; then
    rm /etc/nginx/conf.d/default.conf > /dev/null
fi

sudo cp -ivf $CONFIG_PROVISION_PATH/nginx/serverblock_default.conf /etc/nginx/conf.d/default.conf
chmod 644 /etc/nginx/conf.d/default.conf

if [ "$(ls -A $CONFIG_PROVISION_PATH/nginx/serverblocks)" ]; then
    serverblocks=$(ls $CONFIG_PROVISION_PATH/nginx/serverblocks)
    for serverblock in $serverblocks
    do
        if [ -e "/etc/nginx/conf.d/$serverblock" ]; then
            rm /etc/nginx/conf.d/$serverblock > /dev/null
        fi
        sudo cp -ivf $CONFIG_PROVISION_PATH/nginx/serverblocks/$serverblock /etc/nginx/conf.d/$serverblock
    done
fi