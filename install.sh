#!/bin/bash

# Check if stow is installed
if ! command -v stow &>/dev/null; then
	echo "stow not found, installing..."
	# Install stow using Homebrew
	brew install stow
	ln -s $HOME/dotfiles/.stow-global-ignore ~/.stow-global-ignore
fi

if ! command -v bpytop &>/dev/null; then
	echo "bpytop not found, installing..."
	brew install bpytop
fi

if ! command -v lazygit &>/dev/null; then
	echo "lazygit not found, installing..."
	brew install lazygit
fi

echo "Linking files..."

stow --target=$HOME/.config config
stow --target=$HOME root
