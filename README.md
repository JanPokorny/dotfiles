# Dotfiles

Managed with [mise bootstrap](https://mise.jdx.dev/bootstrap.html).

Bootstrap with:

```sh
# Linux: install git first
curl https://mise.run | sh
~/.local/bin/mise bootstrap --adopt JanPokorny/dotfiles --yes

# fnox secrets come from 1Password:
op signin --account ibm.ent.1password.com
```
