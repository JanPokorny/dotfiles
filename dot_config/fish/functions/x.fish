function x
    bass source (pkgx +(string split -f1 ' ' $history[1]) | psub) && eval $history[1]
end
