status is-interactive || return

# No greeting
set fish_greeting

# Load fundle
if not set -q __fundle
    set -g __fundle (curl -sL https://git.io/fundle-install | fish)
end

# Load fundle plugins
fundle plugin IlanCosman/tide
fundle plugin edc/bass
fundle plugin gazorby/fish-abbreviation-tips
fundle plugin nickeb96/puffer-fish
fundle plugin jorgebucaran/autopair.fish
fundle plugin oh-my-fish/plugin-thefuck
fundle plugin oh-my-fish/plugin-direnv
fundle plugin decors/fish-colored-man
fundle plugin kidonng/zoxide.fish
fundle plugin lig/fish-gitmoji --url https://codeberg.org/lig/fish-gitmoji.git
fundle init

# Configure tide
set -gx tide_git_truncation_length 50

# Configure fzf
set -gx FZF_DEFAULT_COMMAND 'find . -type d \( -name .git -o -name node_modules -o -iname "*cache*" \) -prune -o -print'

# Common aliases
alias cat 'bat'
alias ls 'exa --oneline --icons --group-directories-first'
alias clip 'xsel --clipboard'
