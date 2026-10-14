function dirac --wraps dirac
    set -lx OPENAI_API_KEY (op read 'op://rsjz2rywqgfp4o3wmwks7qizea/gf5pvk7rveqittwbpwj3sfhccq/credential' --account ibm.ent.1password.com); or return
    set -lx DIRAC_PROVIDER openai
    set -lx DIRAC_BASE_URL https://ete-litellm.ai-models.vpc.res.ibm.com/v1
    set -lx DIRAC_MODEL aws/claude-opus-5-5
    set -lx DIRAC_NO_AUTO_UPDATE 1
    command dirac --yolo $argv
end
