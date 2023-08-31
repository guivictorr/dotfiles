# git
ln -s ~/dotfiles/env/.gitconfig ~/

# zsh
ln -s ~/dotfiles/env/.zshrc ~/
ln -s ~/dotfiles/env/.spaceshiprc.zsh ~/

# tmux
ln -s ~/dotfiles/tmux/.tmux.conf ~/

# kitty
ln -s ~/dotfiles/kitty/kitty.conf ~/.config/kitty/

# link nvim files
dirs=(nvim nvim/lua nvim/lua/plugins nvim/lua/config)

for dir in "${dirs[@]}"; do
	mkdir -p ~/.config/$dir
	for file in ~/dotfiles/$dir/*; do
		if [ ! -d "$file" ]; then
			ln -s -f $file ~/.config/$dir/
		fi
	done
done
