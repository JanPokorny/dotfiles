#!/bin/bash

echo ""
echo "### INSTALL DOCKER ###"
curl -fsSL https://get.docker.com | sudo sh

if [[ $(uname) == "Linux" ]]; then
  sudo usermod -aG docker $(whoami)
fi
