#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

# Install Homebrew
if test ! $(which brew)
then
  echo " → Installing Homebrew for package management..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Install all apps listed in the brewfile
echo "→ Installing packages using Homebrew..."
brew install $(cat brew/brewfile|grep -v "#")

# Install fuzzy finder
$(brew --prefix)/opt/fzf/install

# Configure git to always use ssh
git config --global --add url."git@github.com:".insteadOf "https://github.com/" ## <-- this is not a good idea because it prevents git usage until ssh
git config pull.rebase false # use merge strategy

gem install cocoapods

