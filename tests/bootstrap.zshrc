#!/usr/bin/env bash

export ZEESH_DEBUG=1

zeesh_dir=${XDG_DATA_HOME:-"$HOME/.local/share"}/zeesh/zeesh-man
if [[ ! -f $zeesh_dir/zeesh.zsh ]]; then
  command git clone https://github.com/zahidkizmaz/zeesh-man.git "$zeesh_dir"
fi
source "$zeesh_dir/zeesh.zsh"

# Install plugins
zeesh_get "zsh-users/zsh-syntax-highlighting"
zeesh_get "zsh-users/zsh-autosuggestions"
zeesh_get "jeffreytse/zsh-vi-mode"
