#!/usr/bin/env bash

LOCAL_CONFIG_PATH=~/.config/git/config.local

make_config() {
    read -p "Enter your git name: " username
    read -p "Enter your git email: " email

    if [ ! -d ~/.config/git ]; then
        mkdir -p ~/.config/git
    fi

    printf "[user]\n\tname = %s\n\temail = %s\n" "$username" "$email" >| $LOCAL_CONFIG_PATH
}

if [ -f $LOCAL_CONFIG_PATH ]; then
    read -p "Local git config already exists. Do you want to replace it? (y/n): " -n 1 -r
    echo # Add a new line
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        make_config
    fi
else
    make_config
fi
