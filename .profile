# shellcheck disable=SC2148

# Fix to prevent LMStudio polluting my dotfiles at every start
# https://github.com/lmstudio-ai/lmstudio-bug-tracker/issues/656#issuecomment-2938234807
# /Users/pco/.lmstudio/bin

# source env exports
if [ -f "${HOME}/.env" ] && [ -z "$ENV_LOADED" ]; then
    source "${HOME}/.env"
fi

# source aliases
if [ -f "${HOME}/.aliases" ]; then
    source "${HOME}/.aliases"
fi

# source functions
if [ -f "${HOME}/.functions" ]; then
    source "${HOME}/.functions"
fi

# source secrets
if [ -f "${HOME}/.secrets" ]; then
    source "${HOME}/.secrets"
fi

# source local configurations
if [ -f "${HOME}/.local_config" ]; then
    source "${HOME}/.local_config"
fi
