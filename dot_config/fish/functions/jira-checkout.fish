function jira-checkout -a issue_key
    # Check local branches
    set local_branch (git branch --list --format='%(refname:short)' $issue_key'-*' )
    echo $local_branch
    if [ $local_branch != '' ]
        git checkout $local_branch
        return 0
    end

    # Check remote branches
    git fetch
    set remote_branch (git branch --list --format='%(refname:short)' origin/$issue_key'-*')
    if [ $remote_branch != '' ]
        git checkout -b $remote_branch
        return 0
    end

    # Create a new branch
    set issue_slug ( \
        jira issue view --plain $issue_key |\
        string replace --filter '  # ' '' |\
        string replace --all --regex '[^a-zA-Z0-9]+' '-' |\
        string replace --all --regex '^-+|-+$' '' |\
        string lower \
    )
    git checkout -b $issue_key-$issue_slug
end
