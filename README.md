# Dotfiles

Managed with [chezmoi](https://www.chezmoi.io/).

## What's inside

- **Fish shell** config with custom prompt, abbreviations, and keybindings
- **Git** config with aliases and interactive rebase tool
- **Ghostty** terminal config
- **Karabiner Elements** keyboard remapping
- **Mise** for platform-agnostic CLI tools (preferred over Homebrew)
- **Homebrew** (macOS only) for casks (GUI apps) and Colima/Docker (better macOS support than Mise)
- **Custom scripts** in `~/.local/bin` (e.g. `git-get` for cloning repos into organized paths)
- **JetBrains Mono Nerd Font** auto-installation

## Bootstrap

```sh
BINDIR=~/.local/bin sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply JanPokorny
```
