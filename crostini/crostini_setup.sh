#!/bin/bash
sudo apt update
sudo apt -y full-upgrade

echo "Installing tmux, ag, rg"
sudo apt install -y tmux silversearcher-ag ripgrep build-essential

echo "Downloading and configuring dotfiles"
cd ~
mv .config .config2
git clone https://github.com/georgebastille/.config.git
mv .config2/* .config/
rm -rf .config2
mv .bashrc .bashrc-archive
ln -s .config/bashrc .bashrc
ln -s .config/bash_profile .bash_profile
ln -s .config/crostini_profile .crostini_profile
ln -s .config/inputrc .inputrc
#ln -s .config/vimrc .vimrc
ln -s .config/tmux.conf .tmux.conf
ln -s .config/tmux .tmux
ln -s .config/crostini_gitconfig .gitconfig
cd .config
git submodule update --init --recursive

cd ~
# Build vim
# bash crostini_vim.sh
# Python
./crostini_python.sh
# Golang
# ./crostini_go.sh
# neovim
sudo ./crostini_nvim.sh
