function preview -a path; [ -f $path ] && viu $path 2>/dev/null || bat --color=always --plain $path || lsd --group-directories-first --color=always --icon=always $path; end;
