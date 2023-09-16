#!/bin/sh

if ! type stow > /dev/null 2>&1; then
    printf "Please install GNU stow."
    exit 1
fi

# CONFIG
[ -d "$HOME/.config" ] || mkdir "$HOME/.config"
stow --target="$HOME/.config" config
