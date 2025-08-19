# shellcheck disable=SC2148

# source again brew to overcome issue with /etc/zprofile and path_helper
# If you don't want to run this source again, consider removing /etc/zprofile (requires sudo privileges).
if [ -f "${HOME}/.env" ]; then
    source "${HOME}/.env"
    # remove duplicates due to sourcing .env twice
    typeset -U path manpath
fi