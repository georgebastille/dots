#!/bin/bash

# Setup sudo privs
# setup package installer
#
# Install packages
# tmux, ripgrep, fd, bat, nodejs, npm, fish, neovim, fzf, uv
#
sudo pacman -S tmux ripgrep fd, bat, nodejs, fish, neovim, fzf, uv

toStowDirs = (fish nvim sway tmux waybar zed)
git checkout -b stow

for path in "${toStowConfig[@]}"
do
	echo "Linking $path ..."
	stow --adopt $path
done

echo "Existing config files copied back, remember to git restore before pushing"
