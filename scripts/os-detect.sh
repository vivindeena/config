#!/usr/bin/env bash

# --- OS Detection and Package Manager Setup --- #

# Detect the operating system
if [[ "$(uname)" == "Darwin" ]]; then
  OS="macOS"
elif [[ -f /etc/arch-release ]]; then
  OS="Arch"
else
  echo "Unsupported OS" >&2
  exit 1
fi

# Define the install function based on the OS
if [[ "$OS" == "macOS" ]]; then
  install() {
    for pkg in "$@"; do
      if ! brew list --formula | grep -q "^${pkg%%/*}$"; then
        echo "Installing $pkg..."
        brew install "$pkg"
      else
        echo "$pkg already installed."
      fi
    done
  }
  export -f install

elif [[ "$OS" == "Arch" ]]; then
  install() {
    for pkg in "$@"; do
      if ! pacman -Q "$pkg" &> /dev/null; then
        echo "Installing $pkg..."
        sudo pacman -S --noconfirm "$pkg"
      else
        echo "$pkg already installed."
      fi
    done
  }
  export -f install
fi
