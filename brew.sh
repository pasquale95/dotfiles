#!/bin/bash

# For our setup on both macOS and Linux, we rely on the "brew" package manager.
# This package manager is reliable and offers the same user experience
# across the platforms.
# If you don't want to install it on your machine, then DO NOT RUN this script.
if (! command -v brew >/dev/null 2>&1); then
    if [ ! -f /opt/homebrew/bin/brew ] || [ -f /home/linuxbrew/.linuxbrew/bin/brew ]; then
        # install since not present
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi

    # source brew env
    if [ -f /opt/homebrew/bin/brew ]; then
        # typical path where resides on macOS
        eval "$(/opt/homebrew/bin/brew shellenv)"
    elif [ -f /home/linuxbrew/.linuxbrew/bin/brew ]; then
        # typical path where resides on linux
        eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    fi
fi

# Make sure we’re using the latest Homebrew.
brew update
# Upgrade any already-installed formulae.
brew upgrade

# Install needed tools
brew install --quiet gcc
brew install --quiet stow
brew install --quiet bash
brew install --quiet asdf
brew install --quiet git
brew install --quiet eza
brew install --quiet tree
brew install --quiet nvim
brew install --quiet bash-completion
brew install --quiet ffmpeg
brew install --quiet nmap
brew install --quiet curl

# Clean brew
brew cleanup