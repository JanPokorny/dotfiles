function up
    mise self-update --yes
    mise upgrade --prune --cd /
    mise bootstrap packages upgrade --yes
end
