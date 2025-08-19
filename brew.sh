#!/bin/bash

if [[ "$OSTYPE" == "darwin"* ]]; then
    # Make sure we’re using the latest Homebrew.
    brew update
    # Upgrade any already-installed formulae.
    brew upgrade

    # Install needed tools
    brew install stow
    brew install bash
    brew install bash-completion
    brew install git
    brew install asdf
    brew install eza
    brew install tree

    # Clean brew
    brew cleanup
else
    echo "You are not on macOS. Aborting."
    exit 1
fi