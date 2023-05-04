status is-interactive || exit 0

# Disable greeting
set fish_greeting

# Configure fzf
set -gx FZF_DEFAULT_COMMAND 'find . -mindepth 1 -type d \( -name .git -o -name node_modules -o -iname "*cache*" \) -prune -o -print'
set -gx FZF_CTRL_T_COMMAND  'find . -mindepth 1 -type d \( -name .git -o -name node_modules -o -iname "*cache*" \) -prune -o -print'
set -gx FZF_ALT_C_COMMAND   'find . -mindepth 1 -type d \( -name .git -o -name node_modules -o -iname "*cache*" \) -prune -o -type d -print'

# Define common aliases
alias cat 'bat --plain --pager=never'
alias ls 'lsd --group-directories-first'
alias clip 'xsel --clipboard'
