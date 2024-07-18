# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export LANG=en_US.UTF-8

# Set name of the theme to load --- if set to "random", it will be random
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="spaceship"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(git zsh-syntax-highlighting)

export FZF_DEFAULT_OPTS='--height 60% --tmux center,40%,60% --layout reverse --no-scrollbar --color=pointer:#C18F40,prompt:#C18F40'
# Set up fzf key bindings and fuzzy completion
# NVM Configuration
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
export GPG_TTY=$(tty)
# Go Binaries
export PATH=$PATH:$(go env GOPATH)/bin

source <(fzf --zsh)
source $ZSH/oh-my-zsh.sh
