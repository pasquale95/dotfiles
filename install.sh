#!/bin/bash

# abort on error
set -e

INSTALL_DEPS=0
INSTALL_FORCE=0
DOTFILES_REPO_DIR="${DOTFILES_REPO_DIR:-${HOME}/dotfiles}"

# Function to display help message
function display_help() {
    cat <<EOF
Usage: $0 [OPTIONS]

Options:
  --deps            Install also the additional packages required by some functions and aliases.
  --force           Force the installation of all dotfiles [WARNING: this command backs all old files under ${DOTFILES_REPO_DIR}/backup].
  -h, --help        Display this help message and exit.

Examples:
  $0
  $0 --skip-deps
EOF
}

function parse_script_args() {
    while [[ "$#" -gt 0 ]]; do
        case "$1" in
        --deps)
            INSTALL_DEPS=1
            ;;
        --force)
            INSTALL_FORCE=1
            ;;
        -h | --help)
            display_help
            exit 0
            ;;
        *)
            echo "Unknown option: $1"
            ;;
        esac
        shift
    done
}

parse_script_args "$@"
echo "🕒 Installing dotfiles..."

if [[ INSTALL_DEPS -eq 1 ]]; then
    # install all the additional dependencies using brew
    "${DOTFILES_REPO_DIR}/brew.sh"
fi

# install missing dependency
if (! command -v stow >/dev/null 2>&1); then
    echo "stow is not installed. Installing it..."
    brew install stow
fi

if [[ INSTALL_FORCE -eq 1 ]]; then
    # move all conflicting files under ~/.dot-backup
    mkdir -p "${DOTFILES_REPO_DIR}/backup"
    
    # Preview stow actions to find conflicting files
    CONFLICTS=$(
        stow -n -v -d "$DOTFILES_REPO_DIR" -t "${HOME}" . 2>&1 \
        | grep 'neither a link nor a directory' \
        | awk -F'over existing target ' '{print $2}' \
        | awk -F' since' '{print $1}' \
        | xargs
    )

    if [[ -n "$CONFLICTS" ]]; then
        mkdir -p "${DOTFILES_REPO_DIR}/backup"
        for file in $CONFLICTS; do
            if [[ -e "${HOME}/${file}" ]]; then
                mv "${HOME}/${file}" "${DOTFILES_REPO_DIR}/backup/"
                echo "💾 Backup conflicting file ${file} to ${DOTFILES_REPO_DIR}/backup"
            fi
        done
    fi
fi

# install dotfiles
# shellcheck disable=SC1091
source "${DOTFILES_REPO_DIR}/.functions"
stow -d "${DOTFILES_REPO_DIR}" -t "${HOME}" .
dot-add-env --local DOTFILES_REPO_DIR="${DOTFILES_REPO_DIR}"

echo "✅ Dotfiles successfully installed!"
echo "Run 'dot-install' to sync the dotfiles in your current shell."