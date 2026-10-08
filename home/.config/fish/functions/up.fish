function up
    mise self-update
    mise upgrade -C /
    mise bootstrap packages update --yes
end
