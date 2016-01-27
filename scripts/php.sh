#!/bin/bash

echo "Installing PHP..."

apt-get install -y php5
apt-get install -y php5-common
apt-get install -y php5-dev

echo "Installing PHP extensions..."

apt-get install -y php5-cli
apt-get install -y php5-fpm
apt-get install -y php5-curl
apt-get install -y php5-intl
apt-get install -y php5-xdebug
apt-get install -y php5-mcrypt
apt-get install -y php5-redis
apt-get install -y php5-mongo
apt-get install -y php5-gd
apt-get install -y php5-mysql

if [ ! -e "/etc/php5/mods-available/mcrypt.ini" ]; then
    cd /etc/php5/fpm/conf.d && sudo ln -s ../../mods-available/mcrypt.ini
fi

echo "Enabling PHP errors..."

sed -i "s/error_reporting = .*/error_reporting = E_ALL/" /etc/php5/apache2/php.ini
sed -i "s/display_errors = .*/display_errors = On/" /etc/php5/apache2/php.ini

if [ ! -e "/usr/local/bin/composer" ]; then
    echo "Installing Composer..."
    curl -sS https://getcomposer.org/installer | php
    sudo cp -iv composer.phar /usr/local/bin/composer
    rm -f composer.phar
fi

sudo composer self-update

echo "Configuring PHP FPM..."

sed -i 's/listen = \/var\/run\/php5-fpm.sock/listen = 127.0.0.1:9000/' /etc/php5/fpm/pool.d/www.conf
