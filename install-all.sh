#!/bin/bash

set -ex

# Generate SSH key
if [[ ! -f "${HOME}/.ssh/id_ed25519" ]]; then
  # TODO: Generate SSH key here
  echo "No default SSH key exists: ~/.ssh/id_ed25519"
  exit 1
fi



# General applications
source ./install-ghostty.sh
source ./install-thermald.sh
source ./install-tmux.sh
source ./install-brave.sh

# Dev tools amd programming languages
source ./install-go.sh
source ./install-nvm.sh

# Platform Engineer tools
source ./install-kubectl.sh
source ./sre/install-minikube.sh

# Omarchy (Hyprland) specific configs
source ./install-omarchy-overrides.sh

# Config files setup
source ./install-stow.sh
source ./install-dotfiles.sh

# Reset shell to load new configs
exec bash
