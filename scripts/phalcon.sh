#!/bin/bash

if [ ! -e "/etc/php/7.0/fpm/conf.d/20-phalcon.ini" ]; then
    echo "Installing Phalcon Framework..."

    curl -s https://packagecloud.io/install/repositories/phalcon/stable/script.deb.sh | sudo bash
    sudo apt-get install -y php7.0-phalcon
fi
