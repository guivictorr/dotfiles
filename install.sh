# git
ln -s -f $PWD/env/.gitconfig ~/

# zsh
ln -s -f $PWD/env/.zshrc ~/

# link nvim files
mkdir -p ~/.config/nvim

ln -s -f $PWD/nvim/init.vim ~/.config/nvim/init.vim
ln -s -f $PWD/nvim/coc-settings.json ~/.config/nvim/coc-settings.json
