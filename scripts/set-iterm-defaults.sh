#!/usr/bin/env bash

ITERM_CONFIG_DIR=$HOME/.config/iterm2/user-prefs

echo "Setting iTerm2 preferences..."

# Specify the preferences directory
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "$ITERM_CONFIG_DIR"
# Tell iTerm2 to use the custom preferences in the directory
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true

echo "Done."
