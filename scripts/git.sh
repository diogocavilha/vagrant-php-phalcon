#!/bin/bash

CONFIG_PROVISION_PATH="/temp/config"
GIT_USER_NAME="User Name"
GIT_USER_EMAIL="email@domain.com"

echo "Installing GIT..."

apt-get install -y git
apt-get install -y git-core

echo "Configuring GIT..."

echo "User name: $GIT_USER_NAME"
echo "User email: $GIT_USER_EMAIL"

git config --global user.name “$GIT_USER_NAME”
git config --global user.email “$GIT_USER_EMAIL”
git config --global color.ui auto
git config --global core.editor "vim"
git config --global diff.tool meld
git config --global push.default simple