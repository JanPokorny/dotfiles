#!/bin/bash

echo
echo "### SETUP FISH ###"
source ~/.profile
which fish | sudo tee -a /etc/shells
chsh -s $(which fish)
