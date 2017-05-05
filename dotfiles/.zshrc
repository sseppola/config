# Source Prezto
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi


# NVM (Node Version Manager)
export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"
