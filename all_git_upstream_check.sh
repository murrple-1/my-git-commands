#!/usr/bin/env sh

if [ $# -ne 2 ]; then
    echo "Usage: $0 [UPSTREAM] [BRANCH]"
    exit
fi

UPSTREAM="$1"
BRANCH="$2"

INITIAL_DIR=$(dirname $(readlink -f "$0"))

"$INITIAL_DIR/do_for_dirs.sh" "test -d .git/ && git show-branch $BRANCH > /dev/null 2>&1 && git show-branch remotes/$UPSTREAM/$BRANCH > /dev/null 2>&1 && git rev-list --left-right --count $UPSTREAM/$BRANCH..$BRANCH; echo;" -c
