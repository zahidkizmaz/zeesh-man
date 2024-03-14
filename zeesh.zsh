#!/usr/bin/env zsh

ZEESH_DEBUG=${ZEESH_DEBUG:-0}
ZEESH_DRY_RUN=${ZEESH_DRY_RUN:-0}
DATA_HOME=${XDG_DATA_HOME:-"$HOME/.local/share"}
PLUGIN_DIR="$DATA_HOME/zeesh"
SOURCED_PLUGINS=()

GITHUB_URL="https://github.com/"
GIT_DOWNLOAD_COMMAND="git clone --depth=1 --quiet"

function _command() {
  local cmd=$1

  if [[ $ZEESH_DRY_RUN -eq 1 ]]; then
    echo "WARNING: zeehs is in dry run mode! Commands will not be executed."
    echo "$cmd"
    return 0
  fi
  eval "$cmd"
  return 0
}

function _log() {
  if [[ $ZEESH_DEBUG -eq 1 ]]; then
    echo "$@"
  fi
}

function _create_plugin_dir() {
  if [[ ! -d $PLUGIN_DIR ]]; then
    _log "INFO: $PLUGIN_DIR doesn't exists. Creating directory: $PLUGIN_DIR."
    _command "mkdir -p $PLUGIN_DIR"
  fi
  return 0
}

function _download_plugin() {
  local plugin_name="${1}"
  local plugin_folder_name="${2}"
  local plugin_url="$GITHUB_URL$plugin_name.git"

  _log "INFO: Downloading plugin: $plugin_name"
  _command "$GIT_DOWNLOAD_COMMAND $plugin_url $PLUGIN_DIR/$plugin_folder_name"
  return 0
}

function _source_plugin() {
  local plugin_location="${1}"
  local repo_name="${2}"

  if [[ ! -f $plugin_location/$.plugin.zsh ]]; then
    _log "DEBUG: sourcing $plugin_location/$repo_name.plugin.zsh"
    _command "source $plugin_location/$repo_name.plugin.zsh"
    SOURCED_PLUGINS+=($plugin_location)
    return 0
  elif [[ ! -f $plugin_location/$.zsh ]]; then
    _log "DEBUG: sourcing $plugin_location/$repo_name.zsh"
    _command "source $plugin_location/$repo_name.zsh"
    SOURCED_PLUGINS+=($plugin_location)
    return 0
  fi
  _log "WARNING: could find anything to source in $plugin_location"
  return 1
}

function setup() {
  _log "DEBUG: zeesh initializing..."
  _create_plugin_dir
  return 0
}

function zeesh_get() {
  local plugin="${1}"
  local user_and_repo_name
  IFS='/' read -rA user_and_repo_name <<<"$plugin"
  local plugin_location="$PLUGIN_DIR/${user_and_repo_name[2]}"

  if [[ ! -d $plugin_location ]]; then
    _log "DEBUG: $plugin doesn't exists. Downloading..."
    _download_plugin "$plugin" "${user_and_repo_name[2]}"
  fi

  if [[ ${SOURCED_PLUGINS[@]} =~ $plugin_location ]]; then
    _log "DEBUG: Already sourced $plugin_location."
    return 0
  fi
  _source_plugin "$plugin_location" "${user_and_repo_name[2]}"
  _log "DEBUG: Sourced plugins: ${SOURCED_PLUGINS[@]}"
  return 0
}

function _zeesh_update_plugin() {
  local plugin_location=$1
  _log "DEBUG: Updating plugin $plugin_location."
  _command "git -C $plugin_location pull origin HEAD --rebase"
}

function zeesh-update() {
  _log "INFO: updating plugins: ${SOURCED_PLUGINS[@]}"
  for plugin_dir in "${SOURCED_PLUGINS[@]}"; do
    _zeesh_update_plugin $plugin_dir
  done
}

setup
