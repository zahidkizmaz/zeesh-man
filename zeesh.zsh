#!/usr/bin/env zsh
set -eo pipefail
IFS=$'\n\t'

ZEESH_DRY_RUN=${ZEESH_DRY_RUN:-0}
DATA_HOME=${XDG_DATA_HOME:-"$HOME/.local/share"}
PLUGIN_DIR="$DATA_HOME/zeesh"

GITHUB_URL="https://github.com/"
GIT_DOWNLOAD_COMMAND="git clone --depth=1 --quiet"

function _command() {
  local cmd=$1

  if [[ $ZEESH_DRY_RUN -eq 1 ]]; then
    echo "WARNING: zeehs is in dry run mode! Commands will not be run."
    echo "$cmd"
    return 0
  fi
  eval "$cmd"
  return 0
}

function _create_plugin_dir() {
  if [[ ! -d $PLUGIN_DIR ]]; then
    echo "WARNING: $PLUGIN_DIR doesn't exists. Creating directory: $PLUGIN_DIR."
    _command "mkdir -p $PLUGIN_DIR"
  fi
  return 0
}

function _download_plugin() {
  local plugin_name="${1}"
  local plugin_folder_name="${2}"
  local plugin_url="$GITHUB_URL$plugin_name.git"

  echo "INFO: Downloading plugin: $plugin_name"
  _command "$GIT_DOWNLOAD_COMMAND $plugin_url $PLUGIN_DIR/$plugin_folder_name"
  return 0
}

function _source_plugin() {
  local plugin_dir="${1}"
  local repo_name="${2}"

  if [[ ! -f $plugin_dir/$.plugin.zsh ]]; then
    echo "DEBUG: sourcing $plugin_dir/$repo_name.plugin.zsh"
    _command "source $plugin_dir/$repo_name.plugin.zsh"
    return 0
  elif [[ ! -f $plugin_dir/$.zsh ]]; then
    echo "DEBUG: sourcing $plugin_dir/$repo_name.zsh"
    _command "source $plugin_dir/$repo_name.zsh"
    return 0
  fi
  echo "WARNING: could find anything to source in $plugin_dir"
}

function setup() {
  printf "DEBUG: zeesh initializing..."

  _create_plugin_dir
}

function zeesh_get() {
  local plugin="${1}"
  local user_and_repo_name
  IFS='/' read -rA user_and_repo_name <<<"$plugin"
  local plugin_location="$PLUGIN_DIR/${user_and_repo_name[2]}"

  if [[ ! -d $plugin_location ]]; then
    echo "DEBUG: $plugin doesn't exists. Downloading..."
    _download_plugin "$plugin" "${user_and_repo_name[2]}"
  fi
  _source_plugin "$plugin_location" "${user_and_repo_name[2]}"
}

setup
