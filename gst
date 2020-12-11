#!/bin/bash

BLUE="\e[34m"
RESET="\e[0m"

FOUND=true
for x in *; do
  if [ ! -d $x ]; then
      continue
  fi

  cd $x
  if [ ! -d .git ]; then
      cd ..
      continue
  fi

  FOUND=false
  if [ ! -z "$(git status --porcelain=v2)" ]; then
    echo
    echo -e "$BLUE###########################################$RESET"
    echo -e "$BLUE$x$RESET"
    git status
  fi
  cd ..
done

if $FOUND; then
    echo "No git repos were found."
    exit 1
fi

