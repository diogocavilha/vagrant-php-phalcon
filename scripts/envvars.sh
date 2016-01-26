#!/bin/bash

CONFIG_PROVISION_PATH="/temp/config"

if [ -e "$CONFIG_PROVISION_PATH/profile" ]; then
    echo "Importing environment variables..."

    if [ ! -e "/home/vagrant/.profile.bkp" ]; then
        cp -iv /home/vagrant/.profile /home/vagrant/.profile.bkp
    else
        cat /home/vagrant/.profile.bkp > /home/vagrant/.profile
    fi

    cat $CONFIG_PROVISION_PATH/profile
    cat $CONFIG_PROVISION_PATH/profile >> /home/vagrant/.profile
fi