#!/bin/bash

CONFIG_PROVISION_PATH="/temp/config"

echo "Installing Nginx..."

apt-get install -y nginx

echo "Importing Nginx configuration..."

sudo rm -rf /etc/nginx/sites-available/*.* > /dev/null
sudo rm -rf /etc/nginx/sites-available/* > /dev/null
sudo rm -rf /etc/nginx/sites-enabled/*.* > /dev/null
sudo rm -rf /etc/nginx/sites-enabled/* > /dev/null
sudo rm -rf /etc/nginx/conf.d/*.* > /dev/null
sudo rm -rf /etc/nginx/conf.d/* > /dev/null

sudo cp -iv $CONFIG_PROVISION_PATH/nginx/conf.d/* /etc/nginx/conf.d/