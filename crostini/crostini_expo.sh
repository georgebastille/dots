#!/bin/bash

# nodejs & npm 
cd ~
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo bash

#mkdir ~/.npm-global
#npm config set prefix '~/.npm-global'

# expo
# Maybe unnecessary now we swithched the global prefix
# sudo chown -R `whoami`: /usr/lib/node_modules
# npm install -g expo-cli
