# Set up PATH first
. "$HOME/.local/bin/env"
. "$HOME/.atuin/bin/env"
export PATH=/Users/shadow/.opencode/bin:$PATH

# Initialize completion system (fixes compdef errors)
autoload -Uz compinit
compinit -C  # -C skips security check for faster loading

# Prompt (fast, async)
eval "$(starship init zsh)"

# Atuin shell history (now that it's in PATH)
eval "$(atuin init zsh)"

# OpenClaw completion (now that compinit is loaded)
# Suppress Node.js deprecation warnings from openclaw
source <(NODE_NO_WARNINGS=1 openclaw completion --shell zsh)
