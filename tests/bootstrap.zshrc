#!/usr/bin/env zsh

export ZEESH_DEBUG=1

if [[ ! -f ${XDG_DATA_HOME:-"$HOME/.local/share"}/zeesh/zeesh-man/zeesh.zsh ]]; then
  command git clone https://github.com/zahidkizmaz/zeesh-man.git ${XDG_DATA_HOME:-"$HOME/.local/share"}/zeesh/zeesh-man
fi
source ${XDG_DATA_HOME:-"$HOME/.local/share"}/zeesh/zeesh-man/zeesh.zsh

# Install plugins
zeesh_get "zsh-users/zsh-syntax-highlighting"
zeesh_get "zsh-users/zsh-autosuggestions"
zeesh_get "jeffreytse/zsh-vi-mode"
