#!/usr/bin/env sh

if [ $# -lt 1 ]; then
    echo "Usage: $0 [COMMIT_HASH] [EXTRA_ARGS]*"
    exit
fi

COMMIT_HASH=$1
shift

PARENT=$(git log --pretty=%P -n 1 "$COMMIT_HASH")
git commit --fixup "$COMMIT_HASH" "$@"
GIT_SEQUENCE_EDITOR=: git rebase -i --autosquash "$PARENT"
