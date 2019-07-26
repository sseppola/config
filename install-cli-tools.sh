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

gem install cocoapods

