#!/usr/bin/env bash

# TODO This should check for the presence of a local config file first before creating one
# TODO Maybe move this into a callable function in here?
read -p "Enter your git username: " username
read -p "Enter your git email: " email

if [ ! -d ~/.config/git ]; then
    mkdir -p ~/.config/git
fi

printf "[user]\n\tname = %s\n\temail = %s\n" "$username" "$email" >> ~/.config/git/config.local
