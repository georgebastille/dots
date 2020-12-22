#!/bin/bash
is_user_root () { [ ${EUID:-$(id -u)} -eq 0 ]; }

if ! is_user_root; then
    echo "Must be root to install"
    exit 1
fi

echo "Installing neovim"

apt remove --purge -y vim*

CUSTOM_NVIM_PATH=/usr/local/bin/nvim
curl -o ${CUSTOM_NVIM_PATH} -LO https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
chmod +x ${CUSTOM_NVIM_PATH}
set -u
update-alternatives --install /usr/bin/ex ex "${CUSTOM_NVIM_PATH}" 110
update-alternatives --install /usr/bin/vi vi "${CUSTOM_NVIM_PATH}" 110
update-alternatives --install /usr/bin/view view "${CUSTOM_NVIM_PATH}" 110
update-alternatives --install /usr/bin/vim vim "${CUSTOM_NVIM_PATH}" 110
update-alternatives --install /usr/bin/vimdiff vimdiff "${CUSTOM_NVIM_PATH}" 110
