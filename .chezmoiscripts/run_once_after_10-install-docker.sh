#!/bin/bash

[[ $(uname) == "Darwin" ]] || [[ $(uname -r) =~ "WSL" ]] && exit 0

echo ""
echo "### INSTALL DOCKER ###"
curl -fsSL https://get.docker.com | sudo sh
sudo usermod -aG docker $(whoami)
