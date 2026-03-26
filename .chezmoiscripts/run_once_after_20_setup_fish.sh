#!/bin/bash

echo
echo "### SETUP FISH ###"
source ~/.profile
echo "$HOME/.local/share/mise/shims/fish" | sudo tee -a /etc/shells
chsh -s "$HOME/.local/share/mise/shims/fish"
