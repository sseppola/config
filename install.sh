#!/bin/sh
# Inspired by github.com/paulmillr/dotfiles

[ "${SHELL##/*/}" != "zsh" ] && echo 'You might need to change default shell to zsh: `chsh -s /bin/zsh`'

dir="$HOME/Developer/personal"
mkdir -p $dir

cd $dir
git clone --recursive https://github.com/sseppola/config.git dotfiles
cd dotfiles

# Install basic cli tools (brew, nvm/node, rbenv/ruby)
sh etc/install-cli-tools.sh

# Symlink config files
sh etc/symlink-dotfiles.sh

# Install apps
sh etc/install-apps.sh

# Install VS Code extensions
sh etc/configure-vscode.sh

# Set MacOS configs
sh etc/configure-macos.sh