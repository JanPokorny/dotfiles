# Dotfiles

Managed with [mise bootstrap](https://mise.jdx.dev/bootstrap.html).

Bootstrap with:

```sh
# Linux: install git first
curl https://mise.run | sh
~/.local/bin/mise bootstrap --adopt JanPokorny/dotfiles --yes
```

## Claude through ETE LiteLLM

Opt in per session after bootstrapping:

```sh
claude --settings ~/.config/claude/settings.ete-litellm.json
```

In Fish, `claude-ete` expands to this command.

This overlays the normal Claude settings without changing the default backend.
It uses Pi's ETE LiteLLM gateway and the same 1Password credential (requires
access to the IBM vault and gateway network). Claude uses `aws/claude-opus-5-5`,
not Pi's GPT default; the Opus, Sonnet, and Haiku aliases all use that model,
including background tasks. The base URL omits Pi's `/v1` because Claude adds
`/v1/messages` itself.

## Git navigation

- `g owner/repo` clones over SSH if needed, then enters `~/git/github.com/owner/repo`.
  Also accepts `host/owner/repo`, HTTPS URLs, and `git@host:owner/repo.git`.
- `g`, `g query`, or `g several search terms` opens the television picker for repos
  and their worktrees. Exactly one argument containing `/` always means a repo.
- New clones check out the remote's default branch, falling back to `main`, then
  `master` if the remote default cannot be resolved. Existing checkouts are left unchanged.
- Worktrees live under the root checkout's `.wt/<branch>`, ignored via `~/.config/git/ignore`:
  `git worktree add -b feature/example .wt/feature/example`.
