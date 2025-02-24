#!/bin/bash
set -e

# TODO
# Setup distro independent sudo privs
# Setup distro independent package installer
#
# For Arch based distros
# sudo pacman -S tmux ripgrep fd bat nodejs fish neovim fzf uv

# Linking dot files
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
