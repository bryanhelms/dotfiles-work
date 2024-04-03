#!/usr/bin/env bash

open ./terminal/Dotfile.terminal
# Wait a sec before killing the Terminal
sleep 1
killall Terminal

# These settings seem to do better without a Terminal open
defaults write com.apple.terminal "Default Window Settings" -string "Dotfile"
defaults write com.apple.Terminal "Startup Window Settings" -string "Dotfile"
