#!/bin/bash

echo "Installing PHP..."

sudo apt-get install python-software-properties
sudo add-apt-repository ppa:ondrej/php
sudo apt-get update
sudo apt-get install -y --force-yes php7.0

echo "Installing PHP extensions..."

apt-get install -y --force-yes php7.0-cli
apt-get install -y --force-yes php7.0-fpm
apt-get install -y --force-yes php7.0-curl
apt-get install -y --force-yes php7.0-intl
apt-get install -y --force-yes php7.0-mcrypt
apt-get install -y --force-yes php7.0-gd
apt-get install -y --force-yes php7.0-mysql
apt-get install -y --force-yes php-redis
apt-get install -y --force-yes php-xdebug

sudo phpenmod mcrypt

if [ ! -e "/usr/local/bin/composer" ]; then
    echo "Installing Composer..."
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
fi
sudo composer self-update

echo "Configuring PHP FPM..."

sed -i 's#listen = /run/php/php7.0-fpm.sock#listen = 127.0.0.1:9000#' /etc/php/7.0/fpm/pool.d/www.conf
