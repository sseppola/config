#/bin/bash

echo "Copying .android_studio_env_vars to home directory"
cp ./.android_studio_env_vars ~/.android_studio_env_vars

echo "Copying AndroidStudioEnvVars.plist to LaunchAgents"
cp ./AndroidStudioEnvVars.plist ~/Library/LaunchAgents/AndroidStudioEnvVars.plist

echo "Loading LaunchAgent with launchctl"
launchctl load ~/Library/LaunchAgents/AndroidStudioEnvVars.plist