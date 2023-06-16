status is-interactive || exit 0

# CTRL-N: Open new Alacritty window from anywhere
bind \cn 'alacritty --working-directory (pwd) & disown'
