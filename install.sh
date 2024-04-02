#!/usr/bin/env bash

which -s brew
if [[ $? != 0 ]] ; then
    # Install Homebrew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Homebrew already installed"
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


# Once Brew is installed, and git has been installed, and stow has copied over the general
# git config, set our local config
if [[ -x "$(command -v git)" ]]; then
    # Set up git config
    ./scripts/create-local-git-config.sh
else
    echo "Git is not installed. Please install git and run this script again."
    exit 1
fi
