#!/usr/bin/env zsh


# Configure zsh
# source ./setup-zsh.sh


# Init nvm directory
if [ ! -d "$HOME/.nvm" ]; then
  mkdir ~/.nvm
fi


cp -R ./dotfiles/ ~/

echo "→ Installing packages using Homebrew..."
brew install $(cat brew/brewfile|grep -v "#")

# TODO: set up ZSH
# zsh setup-zsh.sh

echo "→ Configuring Git..."
# Personal information in your .gitlocal, not .gitconfig!
ln -s ~/dotfiles/git/config ~/.gitconfig
ln -s ~/dotfiles/git/attributes ~/.gitattributes
ln -s ~/dotfiles/git/ignore_global ~/.gitignore_global


# Set macOS defaults
echo "→ Set macOS defaults... (It'll shut down Terminal!)"
sh misc/macos
