status is-interactive || exit 0
set -gx MCFLY_FUZZY 2
set -gx MCFLY_PROMPT "❯"
mcfly init fish | source
