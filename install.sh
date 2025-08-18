#!/bin/bash

echo "🕒 Installing dotfiles..."
source ./.functions
dot-install
dot-add-env --local DOTFILES_REPO_DIR="${DOTFILES_REPO_DIR:-$PWD}"

echo "✅ Dotfiles successfully installed!"