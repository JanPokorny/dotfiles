#!/bin/bash

echo
echo "### INSTALL ASDF PLUGINS ###"

if [[ $(uname) == "Darwin" ]]; then
  BREW_PATH="/opt/homebrew/bin/brew"
else
  BREW_PATH="/home/linuxbrew/.linuxbrew/bin/brew"
fi

echo "# NodeJS"
$BREW_PATH plugin-add nodejs || true

echo "# Python"
$BREW_PATH plugin-add python || true
