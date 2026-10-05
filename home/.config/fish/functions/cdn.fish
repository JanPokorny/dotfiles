function cdn
    set -l d (tv dirs --hide-preview -i "$argv")
    test -n "$d" && cd $d
end
