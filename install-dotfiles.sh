#!/usr/bin/env bash

NODE_VERSION=16

# Install Homebrew
if test ! $(which brew)
then
  echo " → Install Homebrew before running this command"
  exit 1 
fi


echo "→ Configuring Git..."
# Personal information in your .gitlocal, not .gitconfig!
ln -s "$(pwd)/dotfiles/git/config" ~/.gitconfig
ln -s "$(pwd)/dotfiles/git/.gitmessage" ~/.gitmessage
# ln -s "$(pwd)/dotfiles/git/attributes ~/.gitattributes
ln -s "$(pwd)/dotfiles/git/ignore_global" ~/.gitignore_global


# Install nvm, node and global npm packages
if [ ! -f ~/.nvm/nvm.sh ]; then
  echo "→ Installing Node Version Manager (NVM)"
  mkdir -p ~/.nvm
  ln -s "$(pwd)/dotfiles/.nvmrc" ~/.nvmrc
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.36.0/install.sh | bash
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

if [ "$(nvm current)" == "none" ]; then
  echo "→ Installing Node Version Manager (NVM)";
  nvm install $NODE_VERSION
  nvm alias default $NODE_VERSION

  echo "→ Installing npm packages..."
  npm install -g $(cat misc/npm_globals|grep -v "#")
  ln -s "$(pwd)/dotfiles/.npmrc" ~/.npmrc
fi

# Setup and configure ZSH
ln -s "$(pwd)/dotfiles/.zshrc" ~/.zshrc
ln -s "$(pwd)/dotfiles/.zpreztorc" ~/.zpreztorc
source ./setup-zsh.sh

ln -s "$(pwd)/emacs/config.el ~/.emacs.d/config.el"
ln -s "$(pwd)/emacs/packages.el ~/.emacs.d/packages.el"

# Set macOS defaults
echo "→ Set macOS defaults... (It'll shut down Terminal!)"
sh misc/macos
