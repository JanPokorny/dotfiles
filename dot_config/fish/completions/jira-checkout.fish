complete --exclusive --command jira-checkout --arguments '$(jira issue list -a$(jira me) --plain | tail -n +2 | string replace --all --regex \'\\t+\' \'\t\' | awk -F\'\t\' -v OFS=\'\t\' \'{ if($4 == "To Do" || $4 == "In Progress" || $4 == "In Tech Review") print $2, $3 }\')'
