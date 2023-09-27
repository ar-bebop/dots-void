#!/bin/sh

case "$(file -Lb --mime-type -- "$1")" in
    image/*)
        w=$(($2-4)) # OFFSET SO IMAGES APPEAR SOMEWHAT CENTER
        chafa -s "$w" "$1"
        exit 1 # nonzero exit disables caching
        ;;
    *)
        bat --color always --plain "$1"
        ;;
esac
