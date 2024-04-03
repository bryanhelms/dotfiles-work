#!/usr/bin/env bash

if command -v brew &>/dev/null; then
    echo "Homebrew is already installed."
else
    echo "Installing Homebrew..."

    # Install Homebrew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    (echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> ~/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"

    echo "Done."
fi

# Get brew ready to go
brew update
brew upgrade

brew tap homebrew/cask-versions

# Install the Brewfile
brew bundle install --file=brew/Brewfile

# Make sure we have a local .config
mkdir -p ~/.config

# Check if stow exists
if ! command -v stow &> /dev/null; then
    echo "Stow is not installed. The brew bundle must have failed. Check the status and run again."
    exit 1
fi

# Now that we have stow, copy over all the config files
stow --target "$HOME" --no-folding git
stow --target "$HOME"              zsh
stow --target "$HOME"              p10k
stow --target "$HOME" --no-folding vim
stow --target "$HOME"              iterm2

# Install Oh-My-Zsh if it's not already present
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    ./scripts/install-omz.sh
else
    echo "Oh-My-Zsh is already installed."
fi

# Once Brew is installed, and git has been installed, and stow has copied over the general
# git config, set our local config
if [[ -x "$(command -v git)" ]]; then
    # Set up git config
    ./scripts/create-local-git-config.sh
else
    echo "Git is not installed. Please install git and run this script again."
    exit 1
fi

# Set preferences for iterm2
./scripts/set-iterm-defaults.sh

# TODO Set settings for iterm2, making sure to set the font setting
# Set mac defaults
# Consider setting the default font for Apple terminal (probably not needed)
# See if we need to set the default integrated terminal font settings for VSCode
