#!/bin/bash

[[ $(uname) == "Darwin" ]] && exit 0

echo ""
echo "### INSTALL DOCKER ###"
curl -fsSL https://get.docker.com | sudo sh
sudo usermod -aG docker $(whoami)
