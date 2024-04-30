#!/bin/bash
is_user_root () { [ ${EUID:-$(id -u)} -eq 0 ]; }

if ! is_user_root; then
    echo "Must be root to install"
    exit 1
fi

echo "Installing neovim"

#apt remove --purge -y vim*
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
rm -rf /opt/nvim-linux64
tar -C /opt -xzf nvim-linux64.tar.gz
rm ./nvim-linux64.tar.gz

CUSTOM_NVIM_PATH=/opt/nvim-linux64/bin/nvim

#install vimplug TODO - avoid root owning this file
#sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
#       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Install python env for neovim TODO
# sh -c 'conda env create -f ~/.config/neovim-env.yml'

set -u
update-alternatives --remove-all ex
update-alternatives --remove-all vi
update-alternatives --remove-all view
update-alternatives --remove-all vim
update-alternatives --remove-all vimdiff
update-alternatives --remove-all nvim

update-alternatives --install /usr/bin/ex ex "${CUSTOM_NVIM_PATH}" 110
update-alternatives --install /usr/bin/vi vi "${CUSTOM_NVIM_PATH}" 110
update-alternatives --install /usr/bin/view view "${CUSTOM_NVIM_PATH}" 110
update-alternatives --install /usr/bin/vim vim "${CUSTOM_NVIM_PATH}" 110
update-alternatives --install /usr/bin/vimdiff vimdiff "${CUSTOM_NVIM_PATH}" 110
update-alternatives --install /usr/bin/nvim nvim "${CUSTOM_NVIM_PATH}" 110
