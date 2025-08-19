# shellcheck disable=SC2148

# source env exports
if [ -f "${HOME}/.env" ] && [ -z "$ENV_LOADED" ]; then
    source "${HOME}/.env"
fi