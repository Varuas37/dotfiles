
. "$HOME/.local/bin/env"

# prompt
eval "$(starship init zsh)"
# https://atuin.sh/ - stores shell history
eval "$(atuin init zsh)"

. "$HOME/.atuin/bin/env"

# opencode
export PATH=/Users/shadow/.opencode/bin:$PATH
