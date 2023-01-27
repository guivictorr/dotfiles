# git
ln -s -f $PWD/env/.gitconfig ~/

# zsh
ln -s -f $PWD/env/.zshrc ~/

# link nvim files
mkdir -p ~/.config/nvim
mkdir -p ~/.config/nvim/lua
mkdir -p ~/.config/nvim/after/plugin
ln -s -f $PWD/nvim/init.lua ~/.config/nvim/init.lua
ln -s -f $PWD/nvim/lua/plugins.lua ~/.config/nvim/lua/plugins.lua
ln -s -f $PWD/nvim/lua/base.lua ~/.config/nvim/lua/base.lua
ln -s -f $PWD/nvim/after/plugin/lualine.rc.lua ~/.config/nvim/after/plugin/lualine.rc.lua

# link vscode files
ln -s -f $PWD/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
ln -s -f $PWD/vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json


