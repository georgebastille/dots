#!/bin/bash
sudo apt update

echo "Installing tools"
sudo apt install -y tmux ripgrep batcat build-essential

#echo "Downloading and configuring dotfiles"
cd ~

[ -d ~/.config ] && mv .config .config2 
git clone https://github.com/georgebastille/.config.git .config
[ -d ~/.config2 ] && mv .config2/* .config/ && rm -rf .config2

mv .bashrc .bashrc-archive
ln -s .config/bashrc .bashrc
ln -s .config/bash_profile .bash_profile
ln -s .config/crostini_profile .crostini_profile
ln -s .config/inputrc .inputrc
ln -s .config/tmux.conf .tmux.conf
ln -s .config/tmux .tmux
ln -s .config/crostini_gitconfig .gitconfig
cd .config
git submodule update --init --recursive

cd ~
# neovim
sudo ./crostini/crostini_nvim.sh
# uv for python
curl -LsSf https://astral.sh/uv/install.sh | sh
