# Instructions

[Source](https://dev.to/oscherler/move-android-studio-virtual-devices-on-a-mac-5ej5)

## TLDR

- Two important files
  - `.android_studio_env_vars` which is symlinked in `$HOME`
  - `AndroidStudioEnvVars.plist` which is symlinked via `symlink-dotfiles.sh`
- `launchctl` loads the plist on startup
