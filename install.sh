# git
ln -s ~/dotfiles/env/.gitconfig ~/

# zsh
ln -s ~/dotfiles/env/.zshrc ~/
ln -s ~/dotfiles/env/.spaceshiprc.zsh ~/

# link vscode files
ln -s ~/dotfiles/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
ln -s ~/dotfiles/vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json

# link nvim files
dirs=(nvim nvim/lua nvim/lua/plugins)

for dir in "${dirs[@]}"; do
  mkdir -p ~/.config/$dir
  for file in ~/dotfiles/$dir/*; do
    if [ ! -d "$file" ]; then
      ln -s -f $file ~/.config/$dir/
    fi
  done
done

