# shellcheck disable=SC2148

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