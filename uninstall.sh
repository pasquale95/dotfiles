#!/bin/bash

echo "🕒 Uninstalling dotfiles..."

# install missing dependency
if (! command -v stow >/dev/null 2>&1); then
    echo "stow is not installed. Installing it..."
    brew install stow
fi

# install dotfiles
source ./.functions
dot-uninstall

echo "✅ Dotfiles successfully installed!"