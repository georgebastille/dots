#!/bin/bash

# Setup sudo privs
# setup package installer
#
# Install packages
# tmux, ripgrep, fd, bat, nodejs, npm, fish, neovim, fzf, uv
#
sudo pacman -S tmux ripgrep fd, bat, nodejs, fish, neovim, fzf, uv

toLinkDirs = (fish nvim sway tmux waybar zed)

for path in "${toLinkConfig[@]}"
do
	[ -d "~/.config/$path" ] && mv "~/.config/$path" "~/.config/$path.old"
	ln -s "$path" ~/.config/
done
