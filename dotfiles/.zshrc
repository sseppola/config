# Source Prezto
# if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
#   source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
# fi

# Source Antigen
source /usr/local/share/antigen/antigen.zsh

ANTIGEN_LOG=$HOME/.antigen/antigen.log

antigen use oh-my-zsh

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions

antigen bundle history-substring-search
antigen bundle colored-man-pages
antigen bundle autojump
antigen bundle timer

# Antigen themes
antigen theme denysdovhan/spaceship-prompt
SPACESHIP_PYENV_SHOW=false
SPACESHIP_TIME_SHOW=true


# antigen theme geoffgarside
# antigen bundle tylerreckart/hyperzsh

# antigen bundle ~/config/themes bluloco.zsh-theme --no-local-clone
# antigen theme bluloco

antigen apply

# NVM (Node Version Manager)
export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Zsh-completions
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi
# fpath=(/usr/local/share/zsh-completions $fpath)

export PATH="/usr/local/sbin:$PATH"

# Language settings
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# alt + arrow-key keybindings
bindkey "\e\e[D" backward-word
bindkey "\e\e[C" forward-word
# Source: https://stackoverflow.com/questions/12382499/looking-for-altleftarrowkey-solution-in-zsh

# Make Fuzzy Find use `fd` instead of `find`
export FZF_DEFAULT_COMMAND='fd --type f'

# History config, based on https://news.ycombinator.com/item?id=22919536
setopt INC_APPEND_HISTORY   
setopt SHARE_HISTORY
setopt HIST_IGNORE_SPACE     # don't add commands that start with space to history
setopt HIST_IGNORE_DUPS      # prevents sequential diplicates in history
setopt HIST_IGNORE_ALL_DUPS  # prevent duplicates in history
setopt HIST_FIND_NO_DUPS     # don't show duplicates when browsing history

# export HISTCONTROL=ignorespace:ignoredups


# Configure Android environment variables
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

export JAVA_HOME=`/usr/libexec/java_home -v 1.8`

if [ /usr/local/bin/kubectl ]; then source <(kubectl completion zsh); fi

# begin appcenter completion
# . <(appcenter --completion)
# end appcenter completion

# Init pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

export CLOUDSDK_PYTHON=/Users/sindreseppola/.pyenv/shims/python3
export PATH="/usr/local/sbin:$PATH"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/sindreseppola/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/sindreseppola/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/sindreseppola/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/sindreseppola/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# export PATH="/usr/local/opt/ruby@2.5/bin:$PATH"
export PATH="/usr/local/opt/ruby/bin:$PATH"
