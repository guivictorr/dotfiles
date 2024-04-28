#!/bin/bash

# install stow if isn't installed
if ! command -v stow &>/dev/null; then
	echo "stow not found, installing..."
	# Install stow using Homebrew
	brew install stow
	ln -s $HOME/dotfiles/.stow-global-ignore ~/.stow-global-ignore
fi

# install bpytop if isn't installed
if ! command -v bpytop &>/dev/null; then
	echo "bpytop not found, installing..."
	brew install bpytop
fi

# install lazygit if isn't installed
if ! command -v lazygit &>/dev/null; then
	echo "lazygit not found, installing..."
	brew install lazygit
fi

# install tpm if isn't installed
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
	echo "tpm not found, installing..."
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

echo "Linking files..."

stow --target=$HOME/.config config
stow --target=$HOME root
