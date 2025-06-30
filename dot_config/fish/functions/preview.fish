function preview -a path
    if test -z "$path"
        ls
    else if test -d "$path"
        ls "$path"
    else
        chafa "$path" 2>/dev/null || bat --color=always --plain "$path"
    end
end
