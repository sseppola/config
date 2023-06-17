#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v


# Install Homebrew
if test ! $(which brew)
then
  echo " → Installing Homebrew for package management..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo '# Set PATH, MANPATH, etc., for Homebrew.' >> /Users/sindre/.zprofile
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/sindre/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Install all apps listed in the brewfile
echo "→ Installing packages using Homebrew..."
brew install $(cat brew/brewfile|grep -v "#")


# Install fuzzy finder
$(brew --prefix)/opt/fzf/install


# Configure Ruby
brew install rbenv
echo '# Add rbenv to PATH' >> ~/.zshrc
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshrc
echo '$(rbenv init -)' >> ~/.zshrc

gem install cocoapods


# Configure Nodejs (NVM)
NVM_VERSION=v0.39.2
DEFAULT_NODE_VERSION=18.12.0
if [ ! -f "$HOME/.nvm/nvm.sh" ]; then
  echo "→ Installing Node Version Manager (NVM)"
  mkdir -p "$HOME/.nvm"
  curl -o- "https://raw.githubusercontent.com/nvm-sh/nvm/$NVM_VERSION/install.sh" | bash
fi

NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

if [ "$(nvm current)" == "none" ]; then
  echo "→ Installing Node Version Manager (NVM)";
  nvm install $DEFAULT_NODE_VERSION
  nvm alias default $DEFAULT_NODE_VERSION

  echo "→ Installing npm packages..."
  npm install -g $(cat misc/npm_globals|grep -v "#")
fi

# Install SDKman (java)
if [ ! -d "$HOME/.sdkman" ]; then
  curl -s "https://get.sdkman.io" | bash
  source "$HOME/.sdkman/bin/sdkman-init.sh"
  sdk install java 11.0.17-ms
fi