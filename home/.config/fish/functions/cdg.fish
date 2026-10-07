function cdg
    set -l d (printf '%s\\n' ~/git/*/*/* | tv --select-1 -i "$argv")
    test -n "$d" && cd $d
end
