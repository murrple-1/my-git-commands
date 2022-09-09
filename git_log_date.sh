#!/usr/bin/env sh

if [ $# -ne 2 ]; then
    echo "Usage: $0 [DATE] [AUTHOR]"
    echo "DATE should be of form 'YYYY-MM-DD'"
    echo "AUTHOR should be the email address associated with the commit"
    exit
fi

DATE="$1"
AUTHOR="$2"

DATE__DAY_OF_WEEK=$(date -d "$DATE" +%u)

DATE__START_OF_WEEK=$(date -d "$DATE - $DATE__DAY_OF_WEEK days" +%Y-%m-%d)

START_DATE=$(date -d "$DATE__START_OF_WEEK + 1 days" +%Y-%m-%d)
END_DATE=$(date -d "$DATE__START_OF_WEEK + 5 days" +%Y-%m-%d)

do_for_dirs.sh "test -d .git/ && git shortlog -s -n --all --since=\"$START_DATE 00:00:00\" --until=\"$END_DATE 23:29:59\" --author=\"$AUTHOR\"; echo;"
