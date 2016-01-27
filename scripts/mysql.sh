#!/bin/bash

DB_PASSWORD="32130"
CONFIG_PROVISION_PATH="/temp/config"

echo "Installing MySQL..."

apt-get install -y debconf-utils > /dev/null

echo "mysql-server mysql-server/root_password password $DB_PASSWORD" | debconf-set-selections
echo "mysql-server mysql-server/root_password_again password $DB_PASSWORD" | debconf-set-selections

apt-get install -y mysql-server
