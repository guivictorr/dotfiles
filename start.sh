# homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# dotfiles
mkdir ~/www
cd ~/www
git clone https://github.com/guivictorr/dotfiles.git
ln -s ~/www/dotfiles/root/.gitconfig ~/.gitconfig
ln -s ~/www/dotfiles/root/.zshrc ~/.zshrc
ln -s ~/www/dotfiles/config/nvim ~/.config/nvim
ln -s ~/www/dotfiles/config/tmux ~/.config/tmux
ln -s ~/www/dotfiles/config/spaceship.zsh ~/.config/spaceship.zsh
ln -s ~/www/dotfiles/config/ghostty ~/.config/ghostty

brew install tree-sitter-cli
brew install neovim
brew install fzf
brew install fd
brew install eza
brew install ripgrep
brew install lazygit
brew install tmux
brew install tree-sitter-cli
brew install bat

# nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.8/install.sh | bash
nvm install stable

# Oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
