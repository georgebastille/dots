#!/bin/bash

# nodejs & npm 
cd ~
curl -sL https://deb.nodesource.com/setup_12.x > node_install.sh
chmod +x ./node_install.sh
sudo bash ./node_install.sh
sudo apt-get install -y nodejs
rm node_install.sh

mkdir ~/.npm-global
npm config set prefix '~/.npm-global'

# expo
cd ~
# Maybe unnecessary now we swithched the global prefix
# sudo chown -R `whoami`: /usr/lib/node_modules
npm install -g expo-cli
