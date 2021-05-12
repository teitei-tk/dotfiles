#!/bin/sh

set -eu

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
VSCODE_SETTING_DIR=~/Library/Application\ Support/Code/User

if [ -L "${VSCODE_SETTING_DIR}/settings.json" ]; then
  rm "${VSCODE_SETTING_DIR}/settings.json"
fi
ln -s "${SCRIPT_DIR}/settings.json" "${VSCODE_SETTING_DIR}/settings.json"

if [ -L "${VSCODE_SETTING_DIR}/keybindings.json" ]; then
  rm "${VSCODE_SETTING_DIR}/keybindings.json"
fi
ln -s "${SCRIPT_DIR}/keybindings.json" "${VSCODE_SETTING_DIR}/keybindings.json"

cat < ./extensions | while read -r line
do
  code --install-extension "$line"
done
code --list-extensions > extensions
