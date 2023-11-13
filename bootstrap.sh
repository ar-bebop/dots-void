#!/usr/bin/env bash

if ! type stow > /dev/null 2>&1; then
    printf "Please install GNU stow."
    exit 1
fi

usage() {
    cat << EOF
.../bootstrap.sh <argument>

Arguments: (only one may be specified), if none are specified the default is "all".

all         stow all directories
remove      unstow all directories
config      stow config directory
home        stow home directory
EOF
}

# CONFIG
install_config() {
    [ -d "$HOME/.config" ] || mkdir "$HOME/.config"
    stow -R --target="$HOME/.config" config
}
remove_config() {
    stow -D --target="$HOME/.config" config
}

# HOME
install_home() {
    stow -R --dotfiles home
}
remove_home() {
    stow -D --dotfiles home
}

install_all() {
    install_config
    install_home
}
remove_all() {
    remove_config
    remove_home
}

case "$1" in
    all|"")
        install_all
        ;;
    remove)
        remove_all
        ;;
    config)
        install_config
        ;;
    home)
        install_home
        ;;
    *)
        printf "Invalid argument.\n"
        usage
        ;;
esac
