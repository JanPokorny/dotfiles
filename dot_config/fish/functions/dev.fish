function dev
    bass source (pkgx --internal.activate $(realpath .) | psub)
end
