#!/bin/bash

if [ ! -e "/etc/php5/fpm/conf.d/20-phalcon.ini" ]; then
    echo "Installing Phalcon Framework..."

    sudo apt-add-repository ppa:phalcon/stable
    sudo apt-get update
    sudo apt-get install -y php5-phalcon
fi

# VERSION="2.0.8"
# sudo apt-get install -y php5-dev php5-mysql gcc libpcre3-dev

# mkdir /home/vagrant/phalcon
# cd /home/vagrant/phalcon
# git clone git://github.com/phalcon/cphalcon.git
# cd cphalcon
# git checkout tags/phalcon-v$VERSION
# cd build
# sudo ./install

# sudo echo "extension=phalcon.so" >> /etc/php5/fpm/conf.d/20-phalcon.ini
# sudo echo "extension=phalcon.so" >> /etc/php5/cli/conf.d/20-phalcon.ini

# sudo echo extension=phalcon.so > /etc/php5/fpm/conf.d/phalcon.ini
# sudo php5enmod phalcon