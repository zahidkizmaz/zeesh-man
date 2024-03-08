#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

PLUGIN_DIR=${XDG_DATA_HOME:-"$HOME/.local/share"}

function create_plugin_dir() {
  if [[ ! -d $PLUGIN_DIR ]]; then
    echo "WARNING: $PLUGIN_DIR doesn't exist. Creating directory: $PLUGIN_DIR."
    # mkdir -p "$PLUGIN_DIR"
  fi
  return 0
}

function download_plugin() {
  local plugin_url="${1}"
  # git clone --depth=1 "$1" "$PLUGIN_DIR"

  echo "INFO: Downloading plugin: $plugin_url"
  return 0
}

function setup() {
  local plugins="$*"
  printf "INFO: zpman initialized with:\n%s\n" "$plugins"

  create_plugin_dir

  for plugin in $plugins; do
    download_plugin "$plugin"
  done

}

setup "test" "another_"
