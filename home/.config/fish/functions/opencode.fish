function opencode --wraps opencode
    set -lx ETE_LITELLM_API_KEY (op read 'op://rsjz2rywqgfp4o3wmwks7qizea/gf5pvk7rveqittwbpwj3sfhccq/credential' --account ibm.ent.1password.com); or return
    command opencode $argv
end
