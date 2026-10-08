function up
    mise self-update
    mise upgrade --prune --cd /
    mise bootstrap packages upgrade --yes
end
