#!/bin/bash

ORIGINAL_DIR=$(pwd)
REPO_URL="https://github.com/adrianeliasson/.dotfiles"
REPO_NAME=".dotfiles"
REPO_DIR="${HOME}/.dotfiles"

# TODO: Also check that SSH key is generated at correct spot,
# and if not then query to generate ($HOME/.ssh/id_ed25519)

is_stow_installed() {
  pacman -Qi "stow" &> /dev/null
}

if ! is_stow_installed; then
  echo "Install stow first"
  exit 1
fi

cd "${HOME}"

# Check if the repository already exists
if [ -d "$REPO_NAME" ]; then
  echo "Repository '$REPO_NAME' already exists. Skipping clone"
else
  git clone "$REPO_URL" "$REPO_DIR"
fi

if [ $? -ne 0 ]; then
  echo "Failed to clone the repository."
  exit 1
fi

cd "${REPO_DIR}" && exec "${REPO_DIR}/install.sh"
