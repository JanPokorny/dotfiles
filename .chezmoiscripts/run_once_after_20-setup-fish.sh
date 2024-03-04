#!/bin/bash

echo
echo "### SETUP FISH ###"

if [[ $(uname) == "Darwin" ]]; then
  FISH_PATH="/opt/homebrew/bin/fish"
else
  FISH_PATH="/home/linuxbrew/.linuxbrew/bin/fish"
fi

echo $FISH_PATH | sudo tee -a /etc/shells
chsh -s $FISH_PATH
