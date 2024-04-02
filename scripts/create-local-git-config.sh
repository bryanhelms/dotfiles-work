#!/usr/bin/env bash

read -p "Enter your git username: " username
read -p "Enter your git email: " email

if [ ! -d ~/.config/git ]; then
    mkdir -p ~/.config/git
fi

printf "[user]\n\tname = %s\n\temail = %s\n" "$username" "$email" >> ~/.config/git/config.local
