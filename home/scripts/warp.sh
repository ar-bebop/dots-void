#!/bin/sh

check(){
    if ! command -v "$1" > /dev/null 2>&1;then
        echo "please install $1" && exit 1
    fi
}
git_clone(){
    if ping -c 1 github.com > /dev/null 2>&1; then
        git clone https://github.com/ar-bebop/dots.git 2> /dev/null ||
            echo "already cloned repo\n"
    else
        echo "no internet connection" && exit 2
    fi
}

#LOGIC
check git
check stow

if [ "$(pwd)" = "$HOME" ]; then
    git_clone
    cd ./dots
    ./bootstrap.sh && echo "done." || echo "\nplease resolve conflicts"
else
    echo "wrong path" && exit 4
fi
