status is-interactive || exit 0
set -gx FZF_DEFAULT_COMMAND 'find . -mindepth 1 -type d \( -name .git -o -name node_modules -o -iname "*cache*" \) -prune -o -print'
set -gx FZF_CTRL_T_COMMAND  'find . -mindepth 1 -type d \( -name .git -o -name node_modules -o -iname "*cache*" \) -prune -o -print'
set -gx FZF_ALT_C_COMMAND   'find . -mindepth 1 -type d \( -name .git -o -name node_modules -o -iname "*cache*" \) -prune -o -type d -print'
