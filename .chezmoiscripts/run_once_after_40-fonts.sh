#!/bin/bash

echo ""
echo "### FONTS ###"

mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts

echo "# JetBrains Mono NF"
wget -O https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/JetBrainsMono/Ligatures/Medium/JetBrainsMonoNerdFont-Medium.ttf
wget -O https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/JetBrainsMono/Ligatures/Medium/JetBrainsMonoNerdFontMono-Medium.ttf

echo "# Refreshing font cache..."
fc-cache -v -f .
