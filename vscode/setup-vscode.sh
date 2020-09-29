#!/usr/bin/env bash

# Install extensions from extensionsFile
grep -v "#" ./vscode/extensionsFile | while read -r line ; do
    code --install-extension $line
done

# Copy VSCode config from this repo into the active vscode config
rsync -a ./vscode/codeConf/ $HOME/Library/Application\ Support/Code/User/