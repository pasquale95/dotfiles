#!/bin/bash

echo "🕒 Installing dotfiles..."

# install missing dependency
if (! command -v stow >/dev/null 2>&1); then
    echo "stow is not installed. Installing it..."
    brew install stow
fi

# install dotfiles
source ./.functions
dot-install
dot-add-env --local DOTFILES_REPO_DIR="${DOTFILES_REPO_DIR:-$PWD}"
source "${HOME}/.profile"

echo "✅ Dotfiles successfully installed!"