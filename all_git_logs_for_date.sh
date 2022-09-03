#!/usr/bin/env sh

if [ $# -ne 1 ]; then
    echo "Usage: $0 [DATE]"
    echo 'DATE: format YYYY-MM-DD'
    exit
fi

DATE=$1

INITIAL_DIR=$(dirname $(readlink -f "$0"))

"$INITIAL_DIR/do_for_dirs.sh" "test -d .git/ && gitfromdate.sh $DATE murraychristopherson@gmail.com" -c
