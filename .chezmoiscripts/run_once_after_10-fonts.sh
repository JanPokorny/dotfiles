#!/bin/bash

echo ""
echo "### INSTALL FONTS ###"

mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts

wget -O https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/JetBrainsMono/Ligatures/Medium/JetBrainsMonoNerdFont-Medium.ttf
wget -O https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/JetBrainsMono/Ligatures/Medium/JetBrainsMonoNerdFontMono-Medium.ttf

fc-cache -v -f .
