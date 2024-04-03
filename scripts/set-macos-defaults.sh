#!/usr/bin/env bash

echo "Setting macOS defaults..."

# Find more settable defaults here: https://macos-defaults.com/

# Finder: show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true
# Finder: show path bar
defaults write com.apple.finder "ShowPathbar" -bool "true"

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Save screenshots to screenshots folder
SCREENSHOTS=$HOME/Pictures/screenshots
mkdir -p $SCREENSHOTS
defaults write com.apple.screencapture location -string "$SCREENSHOTS"

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"

# Use list view in all Finder windows by default
# Four-letter codes for the other view modes: `icnv`, `clmv`, `glyv`
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Make the function keys be function keys (doesn't work until restart)
defaults write -g com.apple.keyboard.fnState -boolean true

# Need to restart some things after changing settings
killall Dock
killall Finder

echo "Done."
