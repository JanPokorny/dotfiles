# Dotfiles

Managed with [mise bootstrap](https://mise.jdx.dev/bootstrap.html).

Bootstrap with:

```sh
# Linux: install git first
curl https://mise.run | sh
~/.local/bin/mise bootstrap --adopt JanPokorny/dotfiles --yes

# for forwarded LLM:
op signin --account ibm.ent.1password.com
oc login --web --server https://api.dam-cl.fmaas.res.ibm.com:6443
pitchfork restart dam-llm
```
