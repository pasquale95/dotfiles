#!/bin/bash

INSTALL_DEPS=0

# Function to display help message
function display_help() {
    cat <<EOF
Usage: $0 [OPTIONS]

Options:
  --deps            Install also the additional packages required by some functions and aliases.
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
    ./brew.sh
fi

# install dotfiles
source ./.functions
stow -d "${DOTFILES_REPO_DIR:-${HOME}/dotfiles}" -t "${HOME}" .
dot-add-env --local DOTFILES_REPO_DIR="${DOTFILES_REPO_DIR:-$PWD}"

echo "✅ Dotfiles successfully installed!"
echo "Run 'dot-install' to sync the dotfiles in your current shell."