#!/bin/bash

echo ""
echo "### INSTALLING DOCKER ###"
curl -fsSL https://get.docker.com | sudo sh
sudo usermod -aG docker $(whoami)