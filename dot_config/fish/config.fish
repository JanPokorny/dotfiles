status is-interactive || exit 0

# Disable greeting
set fish_greeting

# Configure fzf
set -gx FZF_DEFAULT_COMMAND 'find . -type d \( -name .git -o -name node_modules -o -iname "*cache*" \) -prune -o -print'

# Define common aliases
alias cat 'bat --plain --pager=never'
alias ls 'exa --oneline --icons --group-directories-first'
alias clip 'xsel --clipboard'
