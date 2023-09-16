#!/bin/sh

if ! type stow > /dev/null 2>&1; then
    printf "Please install GNU stow."
    exit 1
fi

[ -d "$HOME/.config" ] || mkdir "$HOME/.config"
stow -t "$HOME/.config" config
