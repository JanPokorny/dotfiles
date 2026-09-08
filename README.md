# Dotfiles

Managed with [mise bootstrap](https://mise.jdx.dev/bootstrap.html). This repo is checked out as `~/.config/mise`.

## What's inside

- **Fish shell** config with custom prompt, abbreviations, and keybindings
- **Git** config with aliases and interactive rebase tool
- **Ghostty** terminal config
- **Karabiner Elements** keyboard remapping
- **Mise** for CLI tools
- **Homebrew casks** for macOS graphical apps (installed by mise, no `brew` needed)
- **Custom scripts** in `~/.local/bin` (e.g. `git-get` for cloning repos into organized paths)
- **JetBrains Mono Nerd Font** auto-installation

## Bootstrap

```sh
curl https://mise.run | sh
~/.local/bin/mise bootstrap --adopt JanPokorny/dotfiles --yes
```

## Daily use

```sh
mise bootstrap status          # what differs
mise bootstrap                 # apply everything (idempotent)
mise bootstrap dotfiles add ~/.claude/settings.json   # capture edits to a copy-mode file
```

Files under `home/` are symlinked into `~` one by one (`symlink-each`), only if tracked by git. To add a dotfile, move it under `home/`, `git add` it, and run `mise bootstrap`.
