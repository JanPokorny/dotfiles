status is-interactive || exit 0

fzf_key_bindings

set -gx FZF_DEFAULT_COMMAND "find . -mindepth 1 -type d \( -name .git -o -name node_modules -o -iname '*cache*' \) -prune -o -print"
set -gx FZF_CTRL_T_COMMAND  "find . -mindepth 1 -type d \( -name .git -o -name node_modules -o -iname '*cache*' \) -prune -o -print"
set -gx FZF_ALT_C_COMMAND   "find . -mindepth 1 -type d \( -name .git -o -name node_modules -o -iname '*cache*' \) -prune -o -type d -print"

set -l  FZF_PREVIEW_OPTS    "--preview 'preview (echo {} | cut -f2)' --preview-window=down --keep-right --layout=reverse"
set -gx FZF_CTRL_T_OPTS     "$FZF_PREVIEW_OPTS"
set -gx FZF_ALT_C_OPTS      "$FZF_PREVIEW_OPTS"
set -gx _ZO_FZF_OPTS        "$FZF_PREVIEW_OPTS --no-sort"
