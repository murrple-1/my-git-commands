#!/usr/bin/env sh

INITIAL_DIR=$(dirname $(readlink -f "$0"))

"$INITIAL_DIR/all_git_status.sh" 2>/dev/null | \grep -B 2 -P "(ahead|behind|diverged)"
