#!/bin/bash

echo
echo "### SETUP FISH ###"
echo /home/linuxbrew/.linuxbrew/bin/fish | sudo tee -a /etc/shells
chsh -s /home/linuxbrew/.linuxbrew/bin/fish
