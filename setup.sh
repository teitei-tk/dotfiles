#!/bin/bash

set -eu

function main() {
  dotfiles_dir="$(cd "$(dirname "$0")" && pwd)"
  home_dir=$HOME
  dotfiles=$(ls -a)
  exclude_list=(README.md .git .github setup.sh setup.py Brewfile Brewfile.mas Makefile vscode ..)

  target_files=()
  for item in $dotfiles; do
    if [[ "${exclude_list[*]}" =~ ${item} ]]; then
      continue
    fi
    target_files+=("${item?}")
  done

  cat<<EOT

-----------update targets-----------
${target_files[@]}
------------------------------------

EOT

  current_datetime=$(date +%Y%m%d%H%M%S)
  for dotfile in "${target_files[@]}"; do
    source_path="$dotfiles_dir/$dotfile"
    target_path="$home_dir/$dotfile"
    if [ -e "$target_path" ] || [ -L "$target_path" ]; then
      echo "$target_path symlink or file exists. move to /tmp/$current_datetime/$dotfile"
      mkdir -p "/tmp/$current_datetime"
      mv "$target_path" "/tmp/$current_datetime/$dotfile"
    fi

    ln -s "$source_path" "$target_path"
  done
}

main
