function claude-lite --description "Claude Code, minimal tools/prompt, no auto memory"
    CLAUDE_CODE_DISABLE_AUTO_MEMORY=1 command claude --settings ~/.claude/lite-settings.json --system-prompt (string collect <~/.claude/lite-prompt.md) $argv
end
