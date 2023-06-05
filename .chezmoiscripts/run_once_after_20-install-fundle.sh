#!/bin/bash

echo
echo "### INSTALL FUNDLE ###"
curl -sfL https://git.io/fundle > ${XDG_CONFIG_HOME:-~/.config}/fish/functions/fundle.fish;
/home/linuxbrew/.linuxbrew/bin/fish -ic "fundle install";
