status is-interactive || return

# No greeting
set fish_greeting

# Tide config
set -gx tide_git_truncation_length 50

# Common aliases
alias cat 'bat'
alias ls 'exa --oneline --icons --group-directories-first'
alias clip 'xsel --clipboard'
