# shellcheck disable=SC2148
# shellcheck disable=SC1091

# Fix to prevent LMStudio polluting my dotfiles at every start
# https://github.com/lmstudio-ai/lmstudio-bug-tracker/issues/656#issuecomment-2938234807
# /Users/pco/.lmstudio/bin

if [ -f "${HOME}/.bashrc" ]; then
  source "${HOME}/.bashrc"
fi
