#!/bin/bash

set -eu

function main() {
  dotfiles_dir="$(cd "$(dirname "$0")" && pwd)"
  home_dir=$HOME
  dotfiles=$(ls -a)
  exclude_list=(AGENTS.md README.md .DS_Store .git .github setup.sh Makefile vscode brewfiles ..)

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
      echo "$target_path symlink or file exists. move to /tmp/dotfiles/$current_datetime/$dotfile"
      mkdir -p "/tmp/dotfiles/$current_datetime"
      mv "$target_path" "/tmp/dotfiles/$current_datetime/$dotfile"
    fi

    ln -s "$source_path" "$target_path"
  done
}

main
