#!/usr/bin/env zsh


# Configure zsh
# source ./setup-zsh.sh


# Init nvm directory
if [ ! -d "$HOME/.nvm" ]; then
  mkdir ~/.nvm
fi


cp -R ./dotfiles/ ~/
