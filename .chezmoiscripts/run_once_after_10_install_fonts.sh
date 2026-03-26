#!/bin/bash

echo ""
echo "### INSTALL FONTS ###"

[[ $(uname -r) =~ "WSL" ]] && exit 0;

if [[ $(uname) == "Darwin" ]]; then
  FONT_FOLDER="$HOME/Library/Fonts"
else
  FONT_FOLDER="$HOME/.local/share/fonts"
fi

mkdir -p "$FONT_FOLDER"
cd "$FONT_FOLDER"

curl -LJO https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/JetBrainsMono/Ligatures/Medium/JetBrainsMonoNerdFont-Medium.ttf
curl -LJO https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/JetBrainsMono/Ligatures/Medium/JetBrainsMonoNerdFontMono-Medium.ttf
curl -LJO https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/JetBrainsMono/Ligatures/Bold/JetBrainsMonoNerdFont-Bold.ttf
curl -LJO https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/JetBrainsMono/Ligatures/Bold/JetBrainsMonoNerdFontMono-Bold.ttf

if [[ $(uname) == "Linux" ]]; then
  fc-cache -v -f "$FONT_FOLDER"
fi
