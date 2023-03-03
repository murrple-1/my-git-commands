#!/usr/bin/env sh

if [ $# -ne 1 ] && [ $# -ne 2 ]; then
    echo "Usage: $0 [COMMAND] [-c]?"
    echo "The COMMAND will be run inside each current subdirectory"
    exit
fi

COMMAND=$1

if [ "$2" = "-c" ]; then
    COLORIZE=1
else
    COLORIZE=0
fi

if [ $COLORIZE = 1 ]; then
    tput setaf 6
fi

pwd

if [ $COLORIZE = 1 ]; then
    tput sgr0
fi

eval "$COMMAND"

for D in *; do
    if [ -d "${D}" ]; then
        cd "${D}" || exit

        if [ $COLORIZE = 1 ]; then
            tput setaf 6
        fi

        pwd

        if [ $COLORIZE = 1 ]; then
            tput sgr0
        fi

        eval "$COMMAND"

        cd ..
    fi
done
