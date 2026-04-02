status is-interactive || exit 0

# Better versions of standard commands
alias cat 'bat --plain --pager=never'
alias ls 'eza --icons --group-directories-first'

# Abbrs
abbr c 'clear'
abbr n 'cd (tv dirs)'
abbr g 'cd (printf \'%s\\n\' ~/git/*/*/* | tv)'

## Git
abbr gcm 'git checkout (git main-branch) && git pull'
abbr grm 'git fetch origin (git main-branch):(git main-branch) && git rebase (git main-branch)'
abbr gpf 'git push --force-with-lease --force-if-includes'
abbr gl 'git log --oneline'

## GitHub PR
abbr prc 'gh pr create --web'
abbr prv 'gh pr view --web'

## Kubectl
abbr kc 'kubectl config use-context'
