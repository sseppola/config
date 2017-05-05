#!/usr/bin/env zsh

# Set default shell to ZSH
# https://rick.cogley.info/post/use-homebrew-zsh-instead-of-the-osx-default/
sudo dscl . -create /Users/$USER UserShell /usr/local/bin/zsh


#### Download Prezto ####
if [ ! -d "$HOME/.zprezto" ]; then
  git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
  cp ./dotfiles/.zpreztorc ~/
fi


# Copy .zshrc file into home directory
cp ./dotfiles/.zshrc ~/

# Reload zsh config
source ~/.zshrc
