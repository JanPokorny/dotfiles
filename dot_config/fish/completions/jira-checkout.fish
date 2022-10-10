complete --exclusive --command jira-checkout --arguments '$(jira issue list -a$(jira me) --plain | tail -n +2 | awk -F\'\t\' -v OFS=\'\t\' \'{ print $2, $3 }\')'
