#!/bin/bash
echo "Building and installing vim"
sudo apt remove --purge -y vim*
sudo apt -y install build-essential python3-dev python3-venv libncurses5-dev
cd ~
mkdir build
cd build 
git clone https://github.com/vim/vim
cd vim/src
./configure --with-features=big --enable-python3interp --disable-gui --enable-cscope
make -j4
sudo make install
