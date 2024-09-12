#!/bin/bash

brew install neovim
brew install tmux
brew install stow
brew install bpytop
brew install lazygit
brew install ripgrep
brew install fd
brew install fzf

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

stow --target=$HOME/.config config
stow --target=$HOME root
