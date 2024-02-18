#!/bin/bash

# Check if stow is installed
if ! command -v stow &>/dev/null; then
	echo "stow not found, installing..."
	# Install stow using Homebrew
	brew install stow
	ln -s $HOME/dotfiles/.stow-global-ignore ~/.stow-global-ignore
fi

echo "Linking files..."

stow --target=$HOME/.config config
stow --target=$HOME root
