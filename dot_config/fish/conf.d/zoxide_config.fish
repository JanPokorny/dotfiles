status is-interactive || exit 0
set -gx _ZO_FZF_OPTS "--preview 'echo {} | cut -f2 | xargs lsd --group-directories-first --color=always --icon=always' --preview-window=down --no-sort --keep-right --height=45% --layout=reverse --tabstop=1"
zoxide init fish | source
bind \ez 'zi; commandline -f repaint'
