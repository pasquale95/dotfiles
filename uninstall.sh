#!/bin/bash

# abort on error
set -e

DOTFILES_REPO_DIR="${DOTFILES_REPO_DIR:-${HOME}/dotfiles}"

echo "🕒 Uninstalling dotfiles..."

# install missing dependency
if (! command -v stow >/dev/null 2>&1); then
    echo "stow is not installed. Installing it..."
    brew install stow
fi

# install dotfiles
# shellcheck disable=SC1091
source "${DOTFILES_REPO_DIR}/.functions"
dot-uninstall

# Restore backup files if present
if [[ -d "${DOTFILES_REPO_DIR}/backup" ]]; then
    echo "🔄 Restoring backup files..."
    
    while IFS= read -r -d '' file; do
        basefile=$(basename "${file}")
        mv -f "${file}" "${HOME}/${basefile}"
        echo "💾 Restored ${basefile} to ${HOME}"
    done < <(find "${DOTFILES_REPO_DIR}/backup" -maxdepth 1 -type f -print0)
fi

echo "✅ Dotfiles successfully uninstalled!"