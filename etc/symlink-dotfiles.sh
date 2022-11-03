#!/bin/sh

dev="$HOME/Developer"
dotfiles="$dev/personal/dotfiles"

echo ""
if [ -d "$dotfiles" ]; then
  echo "Symlinking dotfiles from $dotfiles"
else
  echo "$dotfiles does not exist"
  exit 1
fi

link() {
  from="$1"
  to="$2"
  echo "Linking '$from' to '$to'"
  rm -f "$to"
  ln -s "$from" "$to"
}


for location in $(find home -name '.*'); do
  file="${location##*/}"
  file="${file%.sh}"
  link "$dotfiles/$location" "$HOME/$file"
done

# # link $dotfiles/vim $HOME/.vim
unm=$(uname)
if [ $unm = 'Darwin' ]; then
  vsdir="$HOME/Library/Application Support/Code/User"
else
  vsdir="$HOME/.vscode"
fi

if [ -d "$vsdir" ]; then
  echo "Symlinking VSCode settings"
  link "$dotfiles/vscode/settings.json" "$vsdir/settings.json"
  link "$dotfiles/vscode/keybindings.json" "$vsdir/keybindings.json"
  link "$dotfiles/vscode/snippets" "$vsdir"
fi

# 
# Create a 1password agent shortcut for SSH
# Source: https://developer.1password.com/docs/ssh/get-started/#step-4-configure-your-ssh-or-git-client
# 
op_agent="$HOME/.1password/agent.sock"
if [ ! -e "$op_agent" ]; then
  mkdir -p ~/.1password && link ~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock "$op_agent"
fi

ssh_config="$HOME/.ssh/config"
if [ ! -f "$ssh_config" ]; then
    mkdir -p ~/.ssh
    touch ~/.ssh/config
    echo "Host *" >> "$ssh_config"
    echo "  IdentityAgent \"$op_agent\"" >> "$ssh_config"
fi

# 
# Configure Android Studio to run from external disk
# 
link "$dotfiles/app-configs/AndroidStudio/AndroidStudioEnvVars.plist" ~/Library/LaunchAgents/AndroidStudioEnvVars.plist
mkdir -p "$HOME/Library/LaunchAgents"
launchctl load $HOME/Library/LaunchAgents/AndroidStudioEnvVars.plist