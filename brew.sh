brew update
brew upgrade


# GNU core utilities (those that come with OS X are outdated)
brew install coreutils
brew install moreutils
# GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed
brew install findutils
# GNU `sed`, overwriting the built-in `sed`
brew install gnu-sed --with-default-names


# Bash 4
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before running `chsh`.
brew install bash
brew install bash-completion

# ZSH
brew install zsh
brew install zsh-completions

# Install more recent versions of some OS X tools
brew install vim --with-override-system-vi
brew install homebrew/dupes/nano
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install homebrew/dupes/screen


# git
brew install git
brew install diff-so-fancy

# Node
brew install nvm

# Databases
brew install postgresql

# Misc
# mtr - ping & traceroute. best.
brew install mtr

brew install nginx

brew install imagemagick --with-webp


# Casks
brew cask install iterm2
brew cask install java

## Editors
brew cask install atom
brew cask install visual-studio-code

## Browsers
brew cask install firefox
brew cask install google-chrome
