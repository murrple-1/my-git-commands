#!/usr/bin/env sh

INITIAL_DIR=$(dirname $(readlink -f "$0"))

"$INITIAL_DIR/do_for_dirs.sh" "if [ -d .git/ ]; then git fetch --prune; git status; fi" -c
