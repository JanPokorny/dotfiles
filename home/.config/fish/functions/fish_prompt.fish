function fish_prompt
    set -l last_status $status
    set -l last_duration $CMD_DURATION
    set_color normal

    # FIRST LINE

    # exit code
    if test $last_status -ne 0
        echo -n "󱞩 "
        set_color red
        echo -n "$last_status "
    end

    # duration
    if test $last_duration -ge 3000
        test $last_status -eq 0 && echo -n "󱞩 "
        set_color yellow --dim
        echo -n " "
        set -l hours (math -s0 "$last_duration / 3600000")
        test $hours -gt 0 && echo -n "$hours"h
        set -l minutes (math -s0 "($last_duration % 3600000) / 60000")
        test $minutes -gt 0 && echo -n "$minutes"m
        set -l seconds (math -s0 "($last_duration % 60000) / 1000")
        echo -n "$seconds"s
    end

    echo

    # SECOND LINE

    # working dir
    set_color normal
    if string match -q "$HOME/git/*" "$PWD"
        set_color e15432
        echo -n "󰊢 "
        set_color --dim white
        set -l i 1
        for part in (string split / (string replace "$HOME/git/" "" "$PWD"))
            echo -n "$part"
            if test $i = 3
                # git info
                set_color normal
                echo -n " "
                
                set -l git_info (git status --porcelain=v2 --branch 2>/dev/null)
                set -l git_branch (string match -r '# branch\.head (.+)' $git_info)[2]
                if test "$git_branch" = "(detached)"
                    set git_branch (string sub -l 7 (string match -r '# branch\.oid (.+)' $git_info)[2])
                end
                test "$git_branch" != main -a "$git_branch" != master && echo -n "󰘬 $git_branch"
                
                string match -qrv '^#' $git_info && echo -n ""

                set -l git_ab (string match -r '# branch\.ab \+(\d+) -(\d+)' $git_info)                                                          
                if set -q git_ab[2]
                    test "$git_ab[2]" -gt 0 && echo -n ""
                    test "$git_ab[3]" -gt 0 && echo -n ""
                end

                set_color --dim cyan
                echo -n " "
            else
                echo -n /
            end
            set i (math $i + 1)
        end
    else
        set_color --dim cyan
        echo -n " $(string replace "$HOME" '~' "$PWD")"/
    end

    # THIRD LINE

    echo

    # prompt
    set_color normal
    set_color brgreen
    echo -n ❯ ''
    set_color normal
end
