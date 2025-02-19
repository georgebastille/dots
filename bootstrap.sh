#!/bin/bash

# Setup sudo privs
# setup package installer
#
# Install packages
# tmux, ripgrep, fd, bat, nodejs, npm, fish, neovim, fzf, uv
#
sudo pacman -S tmux ripgrep fd bat nodejs fish neovim fzf uv

toStowDirs=(fish nvim sway tmux waybar zed)
git switch stow

for path in "${toStowDirs[@]}"
do
	echo "Linking $path ..."
	stow --adopt $path
done

git commit -am "Overidden Config files"
git switch master
echo "Existing config files on branch 'stow'"
