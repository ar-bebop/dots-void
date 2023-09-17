#!/bin/sh

COLUMNS=160

MOOD=$(shuf -n 1 -e b d g p s t w y)

COW=$(shuf -n 1 -e $(cowsay -l | tail -n +2))

fortune -a | $(shuf -n 1 -e cowsay cowthink) -$MOOD -f $COW -n

printf "%${COLUMNS}s" | tr " " "="

FONT=$(basename $(find /usr/share/figlet/ -name "*.flf" | shuf -n 1))

printf "$(figlet -f "$FONT" -w "$COLUMNS" -- "VOID")"
