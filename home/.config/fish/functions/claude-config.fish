function claude-config --description 'Overlay settings.NAME.json onto settings.base.json, writing Claude settings.json'
    set -l dir ~/.claude
    set -l file $dir/settings."$argv[1]".json
    if not test -f $file
        printf 'usage: claude-config %s\n' (string replace -rf 'settings\.(.*)\.json' '$1' (path basename $dir/settings.*.json))
        return 1
    end
    set -l tmp (mktemp $dir/.settings.XXXXXX)
    jq -s '.[0] * .[1]' $dir/settings.base.json $file >$tmp; or begin
        rm -f $tmp
        return 1
    end
    mv $tmp $dir/settings.json
end
