#!/bin/bash

echo
echo "### INSTALL ASDF PLUGINS ###"

if [[ $(uname) == "Darwin" ]]; then
  ASDF_PATH="/opt/homebrew/bin/asdf"
else
  ASDF_PATH="/home/linuxbrew/.linuxbrew/bin/asdf"
fi

echo "# NodeJS"
$ASDF_PATH plugin-add nodejs || true

echo "# Python"
$ASDF_PATH plugin-add python || true
