# Source Prezto
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# NVM (Node Version Manager)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# Init pyenv
eval "$(pyenv init -)"

fpath=(/usr/local/share/zsh-completions $fpath)

export PATH="/usr/local/sbin:${HOME}/Library/Android/sdk/platform-tools:${HOME}/Library/Android/sdk/tools:$PATH"

export JAVA_HOME=`/usr/libexec/java_home -v 1.8`

