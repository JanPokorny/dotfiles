status is-interactive || exit 0

# Better versions of standard commands (+many more by plugin-grc)
alias cat 'bat --plain --pager=never'
alias ls 'lsd --group-directories-first'

# Abbrs
abbr r ranger

## Git
abbr gcm 'git checkout (git main-branch) && git pull'
abbr grm 'git fetch origin (git main-branch):(git main-branch) && git rebase (git main-branch)'
