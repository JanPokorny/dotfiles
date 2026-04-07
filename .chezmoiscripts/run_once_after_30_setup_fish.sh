#!/bin/bash
set -euxo pipefail

echo
echo "### SETUP FISH ###"
source ~/.profile
grep -qxF "$HOME/.local/share/mise/shims/fish" /etc/shells || echo "$HOME/.local/share/mise/shims/fish" | sudo tee -a /etc/shells
chsh -s "$HOME/.local/share/mise/shims/fish"
