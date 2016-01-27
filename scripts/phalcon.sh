#!/bin/bash

if [ ! -e "/etc/php5/fpm/conf.d/20-phalcon.ini" ]; then
    echo "Installing Phalcon Framework..."

    sudo apt-add-repository ppa:phalcon/stable
    sudo apt-get update
    sudo apt-get install -y php5-phalcon
fi
