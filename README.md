# Dotfiles

Managed with [mise bootstrap](https://mise.jdx.dev/bootstrap.html).

Bootstrap with:

```sh
# Linux: install git first
curl https://mise.run | sh
~/.local/bin/mise bootstrap --adopt JanPokorny/dotfiles --yes
```

## Git navigation

- `g owner/repo` clones over SSH if needed, then enters `~/git/github.com/owner/repo`.
  Also accepts `host/owner/repo`, HTTPS URLs, and `git@host:owner/repo.git`.
- `g`, `g query`, or `g several search terms` opens the television picker for repos
  and their worktrees. Exactly one argument containing `/` always means a repo.
- New clones check out the remote's default branch, falling back to `main`, then
  `master` if the remote default cannot be resolved. Existing checkouts are left unchanged.
- Worktrees live under the root checkout's `.wt/<branch>`, ignored via `~/.config/git/ignore`:
  `git worktree add -b feature/example .wt/feature/example`.
