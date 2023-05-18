#!/usr/bin/env sh

if [ $# -ne 2 ]; then
    echo "Usage: $0 [DATE] [AUTHOR]"
    echo "DATE should be of form 'YYYY-MM-DD'"
    echo "AUTHOR should be the email address associated with the commit"
    exit
fi

DATE="$1"
AUTHOR="$2"

git shortlog -s -n --all --since="$DATE 00:00:00" --until="$DATE 23:29:59" --author="$AUTHOR"
