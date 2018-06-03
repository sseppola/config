#!/usr/bin/env bash

code --install-extension akamud.vscode-theme-onedark
code --install-extension alefragnani.bookmarks
code --install-extension arcticicestudio.nord-visual-studio-code
code --install-extension PeterJausovec.vscode-docker
# code --install-extension RobinMalfait.prettier-eslint-vscode
code --install-extension bibhasdn.unique-lines
code --install-extension christian-kohler.npm-intellisense
code --install-extension christian-kohler.path-intellisense
code --install-extension dbaeumer.vscode-eslint
code --install-extension dzannotti.vscode-babel-coloring
code --install-extension eg2.tslint
code --install-extension esbenp.prettier-vscode
code --install-extension mikestead.dotenv
code --install-extension mrmlnc.vscode-json5
code --install-extension msjsdiag.debugger-for-chrome
code --install-extension DavidAnson.vscode-markdownlint

rsync -a ./vscode/codeConf/ $HOME/Library/Application\ Support/Code/User/