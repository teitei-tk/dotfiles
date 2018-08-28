#!/bin/sh

ln -s settings.json ~/Library/Application\ Support/Code/User/settings.json
ln -s keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json

cat ./extensions | while read line
do
  code --install-extension $line
done

code --list-extensions > extensions
