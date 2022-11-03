#!/usr/bin/env bash

# Install extensions from extensionsFile
grep -v "#" ./vscode/extensionsFile | while read -r line ; do
    code --install-extension $line
done
