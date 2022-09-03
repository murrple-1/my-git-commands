#!/usr/bin/env sh

INITIAL_DIR=$(dirname $(readlink -f "$0"))

"$INITIAL_DIR/do_for_dirs.sh" "test -d .git/ && git status $*; echo;"
