#!/bin/sh

set -eu

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
VSCODE_SETTING_DIR=~/Library/Application\ Support/Code/User

if [ ! -d "$VSCODE_SETTING_DIR" ]; then
  mkdir -p "$VSCODE_SETTING_DIR"
fi

if [ -L "${VSCODE_SETTING_DIR}/settings.json" ]; then
  rm "${VSCODE_SETTING_DIR}/settings.json"
fi
ln -s "${SCRIPT_DIR}/settings.json" "${VSCODE_SETTING_DIR}/settings.json"

if [ -L "${VSCODE_SETTING_DIR}/keybindings.json" ]; then
  rm "${VSCODE_SETTING_DIR}/keybindings.json"
fi
ln -s "${SCRIPT_DIR}/keybindings.json" "${VSCODE_SETTING_DIR}/keybindings.json"