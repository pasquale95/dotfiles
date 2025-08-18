# dotfiles

Collection of dotfiles that can be used to quickly setup a new macOS.

## Table of Contents <!-- omit in toc -->

- [How to install](#how-to-install)
- [How to uninstall](#how-to-uninstall)
- [Usage](#usage)
  - [dot](#dot)
  - [dot-install](#dot-install)
  - [dot-uninstall](#dot-uninstall)
  - [dot-sync](#dot-sync)
  - [dot-add-env](#dot-add-env)

## How to install

This repo requires both `git` and `stow` to be installed on the target machine.

If so, run:

```shell
export $DOTFILES_REPO_DIR=$HOME/dotfiles
git clone git@github.com:pasquale95/dotfiles.git $DOTFILES_REPO_DIR
cd $DOTFILES_REPO_DIR
stow -d "$DOTFILES_REPO_DIR" -t "$HOME" .
```

## How to uninstall

To uninstall:

```shell
# from $HOME/dotfiles
stow -d "$DOTFILES_REPO_DIR" -t "$HOME"
```

## Usage

By installing this repo, you will get some bash functions that can be useful to handle the dotfiles within your shell

### dot

`dot` allows to quickly go into the dotfiles folder

```shell
# go to $DOTFILES_REPO_DIR from anywhere
dot
```

### dot-install

To install `dotfiles`, run:

```shell
dot-install
```

### dot-uninstall

To remove `dotfiles`, run:

```shell
dot-uninstall
```

### dot-sync

To get the latest `dotfiles` and install them, run:

```shell
dot-sync
```

### dot-add-env

You can add a persistent environment variable for the entire machine running:

```shell
# this env variable will be synced with the other machines
dot-add-env NEW_ENV_VAR=new_value
# or
dot-add-env NEW_ENV_VAR new_value
```

If you want to add an environment variable only for the local machine, run:

```shell
# this env variable will not be synced with the other machines
dot-add-env --local NEW_ENV_VAR=new_value
# or
dot-add-env --local NEW_ENV_VAR new_value
```
