#!/bin/bash

echo ""
echo "### INSTALL DOCKER ###"
curl -fsSL https://get.docker.com | sudo sh

{{ if eq .chezmoi.os "linux" -}}
sudo usermod -aG docker $(whoami)
{{ end -}}
