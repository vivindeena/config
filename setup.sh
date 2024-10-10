#!/bin/zsh

# install xcode-select
xcode-select --install


# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install git
brew install git

# install gh
brew install gh
gh auth login

#cloning .config repo from github
git clone git@github.com:vivindeena/config.git $HOME/.config

# install neovim
brew install neovim

# install ripgrep
brew install ripgrep

# install lazygit
brew install jesseduffield/lazygit/lazygit

# install menslo-nerd-font
brew tap homebrew/cask-fonts
brew install font-meslo-lg-nerd-font

# install alacritty
brew install alacritty

# install tmux
brew install tmux

# install fzf
brew install fzf

# install fd
brew install fd

# setup fd
brew install fd

# install bat
brew install bat

#setting up bat
mkdir -p "$(bat --config-dir)/themes"
cd "$(bat --config-dir)/themes"
curl -O https://raw.githubusercontent.com/folke/tokyonight.nvim/main/extras/sublime/tokyonight_night.tmTheme
bat cache --build

# git delta
brew install git-delta

# tldr
brew install tldr

# install eza
brew install eza

# cloning fzf-git
git clone https://github.com/junegunn/fzf-git.sh.git $HOME/.config/zsh/

# creating a symlink between ~/.config/zsh/.zshrc and ~/.zshrc
rm -f $HOME/.zshrc
sn $HOME/.config/zsh/.zshrc





