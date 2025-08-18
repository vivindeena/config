#!/bin/zsh

# Exit immediately if a command exits with a non-zero status.
set -e

# --- Helper Functions --- #

# Check if a command exists
command_exists() {
  command -v "$1" &> /dev/null
}

# Check if a brew package is installed
brew_package_installed() {
  brew list --formula | grep -q "^${1%%/*}$"
}

# --- Install Homebrew --- #
if ! command_exists brew; then
  echo "Homebrew not found. Installing..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "Homebrew already installed."
fi

# --- Install Brew Packages --- #
brews=(
  git
  gh
  neovim
  ripgrep
  jesseduffield/lazygit/lazygit
  font-meslo-lg-nerd-font
  alacritty
  tmux
  fzf
  # fd is used by fzf to find files
  fd
  bat
  zsh-you-should-use
  btop
  git-delta
  tldr
  eza
  go
)

for pkg in "${brews[@]}"; do
  if ! brew_package_installed "$pkg"; then
    echo "Installing $pkg..."
    brew install "$pkg"
  else
    echo "$pkg already installed."
  fi
done

# --- Setup Bat --- #
if [ ! -d "$(bat --config-dir)/themes" ]; then
  echo "Setting up bat themes..."
  mkdir -p "$(bat --config-dir)/themes"
  cd "$(bat --config-dir)/themes"
  curl --remote-name-all https://raw.githubusercontent.com/rose-pine/tm-theme/main/dist/rose-pine.tmTheme
  bat cache --build
else
  echo "bat themes already set up."
fi

# --- Setup NVM and Node.js --- #
export NVM_DIR="$HOME/.nvm"
if [ ! -s "$NVM_DIR/nvm.sh" ]; then
  echo "Installing nvm..."
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
fi

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

if ! nvm list | grep -q "lts/"; then
  echo "Installing latest LTS version of Node.js..."
  nvm install --lts
  nvm alias default 'lts/*'
else
  echo "Latest LTS version of Node.js already installed."
fi

# --- Setup GVM --- #
if [ ! -s "$HOME/.gvm/scripts/gvm" ]; then
  echo "Installing gvm..."
  bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
else
  echo "gvm already installed."
fi

# --- Clone fzf-git --- #
if [ ! -d "$HOME/.config/zsh/fzf-git" ]; then
  echo "Cloning fzf-git..."
  git clone https://github.com/junegunn/fzf-git.sh.git "$HOME/.config/zsh/fzf-git"
else
  echo "fzf-git already cloned."
fi

# --- Symlink .zshrc --- #
if [ ! -L "$HOME/.zshrc" ]; then
  echo "Creating .zshrc symlink..."
  rm -f "$HOME/.zshrc"
  ln -s "$HOME/.config/zsh/.zshrc" "$HOME/.zshrc"
else
  echo ".zshrc symlink already exists."
fi

# --- Symlink tms --- #
if [ ! -L "/usr/local/bin/tms" ]; then
  echo "Creating tms symlink..."
  mkdir -p "$HOME/.local/bin"
  ln -sf "$HOME/.config/tmux/sessionizer/tms" "/usr/local/bin/tms"
else
  echo "tms symlink already exists."
fi

echo "Setup complete!"
