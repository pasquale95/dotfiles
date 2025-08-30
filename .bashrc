# shellcheck disable=SC2148

# Fix to prevent LMStudio polluting my dotfiles at every start
# https://github.com/lmstudio-ai/lmstudio-bug-tracker/issues/656#issuecomment-2938234807
# /Users/pco/.lmstudio/bin

# source profile
if [ -f "${HOME}/.profile" ]; then
  source "${HOME}/.profile"
fi

if [ -f "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]; then
  export BASH_COMPLETION_DIR_PATH="$HOMEBREW_PREFIX/etc/bash_completion.d"

  # create bash podman autocompletion
  if (command -v podman >/dev/null 2>&1) && [ ! -f "${BASH_COMPLETION_DIR_PATH}/_podman" ]; then
    podman completion bash > "${BASH_COMPLETION_DIR_PATH}/_podman"
  fi

  source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
fi

