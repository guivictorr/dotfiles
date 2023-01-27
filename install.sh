# git
ln -s -f $PWD/env/.gitconfig ~/

# zsh
ln -s -f $PWD/env/.zshrc ~/

# link nvim files
mkdir -p ~/.config/nvim
mkdir -p ~/.config/nvim/lua
ln -s -f $PWD/nvim/init.lua ~/.config/nvim/init.lua
ln -s -f $PWD/nvim/lua/plugins.lua ~/.config/nvim/lua/plugins.lua
ln -s -f $PWD/nvim/lua/base.lua ~/.config/nvim/lua/base.lua

# link vscode files
ln -s -f $PWD/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
ln -s -f $PWD/vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json


