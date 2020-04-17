# Source Prezto
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# NVM (Node Version Manager)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# Init pyenv
eval "$(pyenv init -)"

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

fpath=(/usr/local/share/zsh-completions $fpath)

# Configure Android environment variables
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

export JAVA_HOME=`/usr/libexec/java_home -v 1.8`




if [ /usr/local/bin/kubectl ]; then source <(kubectl completion zsh); fi

# begin appcenter completion
. <(appcenter --completion)
# end appcenter completion
