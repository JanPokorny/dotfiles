status is-interactive || return

# No greeting
set fish_greeting

# Tide config
set -gx tide_git_truncation_length 50

# fzf config
set -gx FZF_DEFAULT_COMMAND 'find . -type d \( -name .git -o -name node_modules -o -iname "*cache*" \) -prune -o -print'

# Common aliases
alias cat 'bat'
alias ls 'exa --oneline --icons --group-directories-first'
alias clip 'xsel --clipboard'
