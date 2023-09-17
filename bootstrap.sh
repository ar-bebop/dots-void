#!/usr/bin/env bash

if ! type stow > /dev/null 2>&1; then
    printf "Please install GNU stow."
    exit 1
fi

usage() {
    cat << EOF
.../bootstrap.sh <argument>

Arguments: (only one may be specified)

install     stow all directories
remove      unstow all directories
EOF
}
# CONFIG
install_config() {
    [ -d "$HOME/.config" ] || mkdir "$HOME/.config"
    stow --target="$HOME/.config" -R config
}
# HOME
install_home() {
    stow --dotfiles -R home
}

remove_all() {
    stow --dotfiles -D config
    stow --target="$HOME/.config" -D config
}

install_config

case "$1" in
    install)
        install_config
        install_home
        ;;
    remove)
        remove_all
        ;;
    *)
        printf "Invalid argument.\n"
        usage
        ;;
esac
