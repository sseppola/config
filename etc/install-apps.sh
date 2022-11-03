#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

# Install Homebrew
if test ! $(which brew)
then
  echo " → Install Homebrew before running this command"
  exit 1
fi

echo "→ Installing applications..."
# Set up Cask, for Homebrew
# Install all apps listed in the caskfile
brew install $(cat brew/caskfile|grep -v "#")

echo "→ Installing fonts..."
# Set up Caskroom-fonts
brew tap homebrew/cask-fonts
# Install all fonts listed in the fontfile
brew install $(cat brew/fontfile|grep -v "#")

# source vscode/setup-vscode.sh