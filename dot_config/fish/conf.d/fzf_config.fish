status is-interactive || exit 0
set -gx FZF_DEFAULT_COMMAND "find . -mindepth 1 -type d \( -name .git -o -name node_modules -o -iname '*cache*' \) -prune -o -print"
set -gx FZF_CTRL_T_COMMAND  "find . -mindepth 1 -type d \( -name .git -o -name node_modules -o -iname '*cache*' \) -prune -o -print"
set -gx FZF_ALT_C_COMMAND   "find . -mindepth 1 -type d \( -name .git -o -name node_modules -o -iname '*cache*' \) -prune -o -type d -print"

set -l  FZF_PREVIEW_OPTS    "--preview 'echo {} | cut -f2 | begin; read x; [ -f $x ] && bat --color=always --plain $x || lsd --group-directories-first --color=always --icon=always $x; end;' --preview-window=down --no-sort --keep-right --height=45% --layout=reverse --tabstop=1"
set -gx FZF_CTRL_T_OPTS     $FZF_PREVIEW_OPTS
set -gx FZF_ALT_C_OPTS      $FZF_PREVIEW_OPTS
set -gx _ZO_FZF_OPTS        $FZF_PREVIEW_OPTS
