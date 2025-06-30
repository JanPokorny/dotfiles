function select
    fd | fzf --preview 'preview (echo {} | cut -f2)' --preview-window=down --keep-right --layout=reverse
end