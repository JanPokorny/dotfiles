# Dotfiles repo

This repo is one user's global mise config and dotfiles. Read this file when
you change the dotfiles.

`etc/AGENTS.md` is the user-global agent instructions. It is deployed to
`~/.claude/CLAUDE.md` and `~/.pi/agent/AGENTS.md`. Change it only when the task
is about those instructions.

## Terms

- **desired**: the files in this repo. The source of truth.
- **applied**: the live files in `$HOME`.
- **adopt**: copy applied to desired (applied -> desired).
- **apply**: copy desired to applied (desired -> applied).

## Always diff first

Run this before `mise dot apply` or `mise bs`:

```sh
mise dot diff
```

It shows the drift between applied and desired files. Then decide per file:
adopt it or apply it.

- Adopt all changed files: `mise dot add --changed --yes`
- Adopt one file: `mise dot add ~/.config/foo --yes`
- Apply: `mise dot apply --yes`

`mise dot apply` overwrites applied files. Local edits to those files are lost
unless you adopt them first.

## Bootstrap

`mise bootstrap` (short `mise bs`) sets up the machine: packages, dotfiles,
shell, tools. Always pass `--yes`. Without it the command stops for
confirmation.

- `mise bs --dry-run`: show what would change. Does not change anything.
- `mise bs status`: show the state of each part.
- `mise bs plan`: show each resource that would change.
- `mise bs --yes`: apply all parts.
- `mise bs --only dotfiles,tools --yes`: apply the named parts only.
- `mise bs --skip tools,task --yes`: apply all parts except the named ones.
- `mise bs packages apply --yes`: install missing packages only.
- `mise bs packages upgrade --yes`: upgrade installed packages.
- `mise bs --update --upgrade --yes`: refresh metadata, then upgrade.

Hooks and the `bootstrap` task run on every `mise bs`. Keep them repeatable.

## Packages

Do not install Homebrew. Do not run `brew` commands. mise installs formulae and
casks itself.

mise installs them into the Homebrew prefix (`/opt/homebrew` on macOS), because
the prebuilt bottles are compiled for that prefix. Paths under `/opt/homebrew`
are correct and do not mean that Homebrew is installed.

Use these keys in `[bootstrap.packages]`:

- `"brew:<formula>"`: a formula.
- `"brew-cask:<app>"`: an application.

Font casks work on Linux too. `[bootstrap.brew]` only configures cask adoption
and tap URLs; it is not a reason to install Homebrew.

## Platforms

The config must be correct on macOS and on Linux, mainly headless Linux (VMs).
Do not add a setting to `config.toml` unless it is portable. Put
platform-specific settings in `config.macos.toml` or `config.linux.toml`.
