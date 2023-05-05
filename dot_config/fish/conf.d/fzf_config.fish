status is-interactive || exit 0
set -gx FZF_DEFAULT_COMMAND "find . -mindepth 1 -type d \( -name .git -o -name node_modules -o -iname '*cache*' \) -prune -o -print"
set -gx FZF_CTRL_T_COMMAND  "find . -mindepth 1 -type d \( -name .git -o -name node_modules -o -iname '*cache*' \) -prune -o -print"
set -gx FZF_ALT_C_COMMAND   "find . -mindepth 1 -type d \( -name .git -o -name node_modules -o -iname '*cache*' \) -prune -o -type d -print"

set -gx FZF_CTRL_T_OPTS     "--preview 'echo {} | cut -f2 | xargs lsd --group-directories-first --color=always --icon=always' --preview-window=down --no-sort --keep-right --height=45% --layout=reverse --tabstop=1"
set -gx _ZO_FZF_OPTS        "--preview 'echo {} | cut -f2 | xargs lsd --group-directories-first --color=always --icon=always' --preview-window=down --no-sort --keep-right --height=45% --layout=reverse --tabstop=1"
