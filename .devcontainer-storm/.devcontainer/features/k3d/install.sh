#!/usr/bin/env bash
set -e

USERNAME="${USERNAME:-"${_REMOTE_USER:-"vscode"}"}"
USERHOME="/home/$USERNAME"
if [ "$USERNAME" = "root" ]; then
    USERHOME="/root"
fi

curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash

# Adds dns fix
if [ -f "${USERHOME}/.zshrc" ]; then
    printf "\n# k3d feature - dns-fix\nexport K3D_FIX_DNS=1\n" >> "${USERHOME}/.zshrc"
fi
