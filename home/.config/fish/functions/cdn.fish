function cdn
    set -l d (tv dirs --select-1 --hide-preview -i "$argv")
    test -n "$d" && cd $d
end
