#!/usr/bin/env bash

if [ -d "$HOME/.oh-my-zsh" ]; then
    echo "Oh-My-Zsh is already installed."
    exit 1
fi

# Install Oh-My-Zsh with the --keep-zshrc flag to prevent it from overwriting our custom .zshrc
echo "Installing Oh-My-Zsh..."

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended --keep-zshrc

echo "Done."
