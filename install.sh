#!/bin/bash
# git
ln -s -f $PWD/env/.gitconfig ~/

# zsh
ln -s -f $PWD/env/.zshrc ~/

# link vscode files
ln -s -f $PWD/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
ln -s -f $PWD/vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json

# link nvim files
dirs=(nvim nvim/lua nvim/plugin nvim/after/plugin)

for dir in "${dirs[@]}"; do
  mkdir -p ~/.config/$dir
  for file in $PWD/$dir/*; do
    if [ ! -d "$file" ]; then
      ln -s -f $file ~/.config/$dir/
    fi
  done
done



