#!/bin/bash

ORIGINAL_DIR=$(pwd)
REPO_URL="https://github.com/adrianeliasson/.dotfiles"
REPO_NAME=".dotfiles"

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
  git clone "$REPO_URL"
fi

if [ $? -ne 0 ]; then
  echo "Failed to clone the repository."
  exit 1
fi

echo "removing old configs"
rm -rf \
  ~/.config/starship.toml \
  ~/.config/tmux/tmux.conf

cd "$REPO_NAME"

# Make backup of bashrc first
mkdir -p "${HOME}/.backup"
cp "${HOME}/.bashrc" "${HOME}/.backup/.bashrc.$(date +%s).bak"
rm "${HOME}/.bashrc"
# stow bashrc
stow bash
# stow ghostty
stow tmux
# stow nvim
stow starship
