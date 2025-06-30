function ai
    echo -n "⌛"
    commandline -f repaint
    commandline (aichat -e $argv)
end
