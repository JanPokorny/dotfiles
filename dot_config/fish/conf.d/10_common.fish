set fish_greeting

source ~/.profile

mise activate fish | source

# Aliases

alias cat 'bat --plain --pager=never'
alias ls 'eza --icons --group-directories-first'

# Abbrs

abbr c 'clear'
abbr n 'cd (tv dirs)'
abbr g 'cd (printf \'%s\\n\' ~/git/*/*/* | tv)'

abbr gcm 'git checkout (git main-branch) && git pull'
abbr grm 'git fetch origin (git main-branch):(git main-branch) && git rebase (git main-branch)'
abbr gpf 'git push --force-with-lease --force-if-includes'
abbr gl 'git log --oneline'

abbr prc 'gh pr create --web'
abbr prv 'gh pr view --web'

abbr kc 'kubectl config use-context'

if command -v pbcopy &>/dev/null
    abbr cbc pbcopy
    abbr cbp pbpaste
end

# Colorized man output

set -gx LESS_TERMCAP_mb (set_color --bold red)
set -gx LESS_TERMCAP_md (set_color --bold cyan)
set -gx LESS_TERMCAP_me (set_color --reset)
set -gx LESS_TERMCAP_so (set_color --background=white black)
set -gx LESS_TERMCAP_se (set_color --reset)
set -gx LESS_TERMCAP_us (set_color --underline brblue)
set -gx LESS_TERMCAP_ue (set_color --reset)
set -gx LESS '-R -s'
