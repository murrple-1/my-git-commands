#!/usr/bin/env sh

if [ $# -ne 1 ]; then
  echo "Usage: $0 [FILE]"
  exit
fi

FILE=$1

git update-index --add --chmod=+x "$FILE"
