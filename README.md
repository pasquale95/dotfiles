# dotfiles

Collection of dotfiles that can be used to quickly setup a new macOS.

## Table of Contents <!-- omit in toc -->

- [How to install](#how-to-install)
- [How to uninstall](#how-to-uninstall)

## How to install

To install:

```shell
git clone git@github.com:pasquale95/dotfiles.git $HOME/dotfiles
cd $HOME/dotfiles
stow .
```

If you install it at a location different than `$HOME/dotfiles`, then use the more generic command:

```shell
stow -t ~ .
```

## How to uninstall

To uninstall:

```shell
# from $HOME/dotfiles
stow -D .

# or from any other location
stow -t ~ -D .
```
