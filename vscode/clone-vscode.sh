#!/usr/bin/env bash

# The following copies the local VSCode settings and extensions
rsync -a $HOME/Library/Application\ Support/Code/User/keybindings.json ./vscode/codeConf/
rsync -a $HOME/Library/Application\ Support/Code/User/settings.json ./vscode/codeConf/
rsync -a $HOME/Library/Application\ Support/Code/User/snippets ./vscode/codeConf/
code --list-extensions >> ./vscode/extensionsFile