status is-interactive || exit 0
zoxide init fish | source
bind \ez 'zi; commandline -f repaint'
