function cdg
    set -l d (printf '%s\\n' ~/git/*/*/* | tv -i "$argv")
    test -n "$d" && cd $d
end
