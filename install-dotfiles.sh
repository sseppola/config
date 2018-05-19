#!/usr/bin/env bash

# Install Homebrew
if test ! $(which brew)
then
  echo " → Installing Homebrew for package management..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi


# Init nvm directory
if [ ! -d "$HOME/.nvm" ]; then
  mkdir ~/.nvm
fi

echo "→ Installing packages using Homebrew..."
brew install $(cat brew/brewfile|grep -v "#")


echo "→ Configuring Git..."
# Personal information in your .gitlocal, not .gitconfig!
ln -s "$(pwd)/dotfiles/git/config" ~/.gitconfig
# ln -s "$(pwd)/dotfiles/git/attributes ~/.gitattributes
ln -s "$(pwd)/dotfiles/git/ignore_global" ~/.gitignore_global


# Install nvm, node and global npm packages
echo "→ Installing Node.js stable."
nvm install stable
echo "→ Installing npm packages..."
npm install -g $(cat misc/npm_globals|grep -v "#")
ln -s "$(pwd)/dotfiles/.npmrc" ~/.npmrc

# Setup and configure ZSH
ln -s "$(pwd)/dotfiles/.zshrc" ~/.zshrc
ln -s "$(pwd)/dotfiles/.zpreztorc" ~/.zpreztorc
source ./setup-zsh.sh

# Set macOS defaults
echo "→ Set macOS defaults... (It'll shut down Terminal!)"
sh misc/macos
