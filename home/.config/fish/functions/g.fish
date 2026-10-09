function g
    if test (count $argv) -ne 1; or not string match -q '*/*' -- "$argv[1]"
        set -l d (begin
            find "$HOME/git" -type d -exec test -e '{}/.git' \; -print -prune | while read -l repo
                git -C "$repo" worktree list --porcelain -z | string split0 | string replace -rf '^worktree ' ''
            end
        end | tv --select-1 --input="$argv")
        test -n "$d"; and cd -- "$d"
        return
    end

    set -l input (string replace -r '\.git$' '' -- (string replace -r '/+$' '' -- "$argv[1]"))
    set -l host
    set -l repo
    if string match -rq '^https?://(?<host>[^/]+)/(?<repo>.+)$' -- "$input"
    else if string match -rq '^git@(?<host>[^:]+):(?<repo>.+)$' -- "$input"
    else if string match -rq '^(?<host>[^/]+)/(?<repo>[^/]+/.+)$' -- "$input"
    else if string match -rq '^(?<repo>[^/]+/[^/]+)$' -- "$input"
        set host github.com
    else
        printf "g: cannot parse '%s'\n" "$argv[1]" >&2
        return 1
    end
    if not string match -rq '^[[:alnum:]][[:alnum:].-]*$' -- "$host"; or not string match -rq '^[[:alnum:]_.-]+(/[[:alnum:]_.-]+)+$' -- "$repo"; or string match -rq '(^|/)\.\.?(/|$)' -- "$repo"
        printf "g: invalid repository '%s'\n" "$argv[1]" >&2
        return 1
    end

    set -l target "$HOME/git/$host/$repo"
    if not test -e "$target"
        git clone --recurse-submodules "git@$host:$repo.git" "$target"; or return
        if not git -C "$target" symbolic-ref --quiet refs/remotes/origin/HEAD >/dev/null
            for branch in main master
                if git -C "$target" show-ref --verify --quiet "refs/remotes/origin/$branch"
                    git -C "$target" switch --recurse-submodules "$branch"; or return
                    break
                end
            end
        end
        mkdir -p "$target/.wt"; or return
    end
    if not test -e "$target/.git"
        printf "g: not a checkout: %s\n" "$target" >&2
        return 1
    end
    cd -- "$target"
end
