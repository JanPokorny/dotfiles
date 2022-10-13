function jira-checkout -a issue_key
    # Check local branches
    set local_branch (git branch --list --format='%(refname:short)' "$issue_key-*")
    if [ -n "$local_branch" ]
        git switch "$local_branch"
        return 0
    end

    # Check remote branches
    git fetch --all
    set remote_branch (git branch --list --remote --format='%(refname:short)' "origin/$issue_key-*" | string replace 'origin/' '')
    if [ -n "$remote_branch" ]
        git switch "$remote_branch"
        return 0
    end

    # Create a new branch
    set issue_slug (
        jira issue view --plain "$issue_key" |
        string replace --filter '  # ' '' |
        string replace --all --regex '[^a-zA-Z0-9]+' '-' |
        string replace --all --regex '^-+|-+$' '' |
        string lower
    )
    git checkout origin/master
    git checkout -b "$issue_key-$issue_slug"
end
